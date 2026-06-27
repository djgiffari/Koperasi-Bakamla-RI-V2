import React, { useState, useEffect, useRef } from 'react';
import { Search, Send, MoreVertical, Phone, Video } from 'lucide-react';
import { io, Socket } from 'socket.io-client';
import { api } from '../lib/api';
import { toast } from '../lib/toast';

const Inbox: React.FC = () => {
  const [contacts, setContacts] = useState<any[]>([]);
  const [activeContact, setActiveContact] = useState<any>(null);
  const [msgInput, setMsgInput] = useState('');
  const [chatHistory, setChatHistory] = useState<any[]>([]);
  const [searchQuery, setSearchQuery] = useState('');
  
  const socketRef = useRef<Socket | null>(null);
  const messagesEndRef = useRef<HTMLDivElement>(null);

  // Auto-scroll to bottom when chat updates
  const scrollToBottom = () => {
    messagesEndRef.current?.scrollIntoView({ behavior: 'smooth' });
  };

  useEffect(() => {
    scrollToBottom();
  }, [chatHistory]);

  const fetchContacts = async () => {
    try {
      const res = await api.get('/chat/contacts');
      setContacts(res);
      // Select first contact by default if exists and no active contact
      if (res.length > 0 && !activeContact) {
        setActiveContact(res[0]);
      }
    } catch (error) {
      console.error('Failed to fetch contacts:', error);
      toast.error('Gagal mengambil daftar kontak');
    }
  };

  useEffect(() => {
    fetchContacts();

    // Inisialisasi Socket.IO
    const API_URL = import.meta.env.VITE_API_URL || 'http://localhost:3000/api';
    const socketUrl = API_URL.replace('/api', '');
    
    const socket = io(socketUrl);
    socketRef.current = socket;

    socket.on('connect', () => {
      // Join sebagai admin
      socket.emit('join', 'admin');
    });

    socket.on('receive_message', (msg: any) => {
      // Jika pesan masuk berasal dari kontak yang sedang dibuka, update layar chat
      setActiveContact((currentActive: any) => {
        if (currentActive && (msg.pengirimId === String(currentActive.id) || msg.penerimaId === String(currentActive.id))) {
          setChatHistory(prev => [...prev, msg]);
          
          // Tandai sudah dibaca di backend jika pesan ini untuk admin dan panel chat terbuka
          if (msg.pengirimId !== 'admin') {
            api.put(`/chat/read/${msg.id}`, {}).catch(console.error);
          }
        }
        return currentActive;
      });
      // Refresh contacts to update last message and unread count
      fetchContacts();
    });

    socket.on('message_sent', (msg: any) => {
      // Dipanggil dari backend sebagai echo bahwa pesan berhasil dikirim
      setChatHistory(prev => [...prev, msg]);
      fetchContacts();
    });

    return () => {
      socket.disconnect();
    };
  }, []);

  const fetchChatHistory = async (userId: string) => {
    try {
      const res = await api.get(`/chat/${userId}`);
      setChatHistory(res);
      // Setelah fetch, refresh contact agar badge unread hilang
      fetchContacts();
    } catch (error) {
      console.error('Failed to fetch history:', error);
      toast.error('Gagal memuat riwayat obrolan');
    }
  };

  // Saat contact berubah, load history
  useEffect(() => {
    if (activeContact) {
      fetchChatHistory(String(activeContact.id));
    }
  }, [activeContact?.id]);

  const handleSend = (e: React.FormEvent) => {
    e.preventDefault();
    if (!msgInput.trim() || !activeContact || !socketRef.current) return;
    
    // Kirim pesan melalui socket
    socketRef.current.emit('send_message', {
      pengirimId: 'admin',
      penerimaId: String(activeContact.id),
      pesan: msgInput
    });
    
    setMsgInput('');
  };

  const filteredContacts = contacts.filter(c => c.name.toLowerCase().includes(searchQuery.toLowerCase()) || c.nip?.includes(searchQuery));

  return (
    <div className="h-[calc(100vh-140px)] flex bg-white/50 backdrop-blur-md border border-slate-200 rounded-2xl overflow-hidden shadow-sm">
      {/* Sidebar Contacts */}
      <div className="w-80 border-r border-slate-200 bg-white flex flex-col hidden md:flex">
        <div className="p-4 border-b border-slate-100">
          <h2 className="text-xl font-bold text-primary font-outfit mb-4">Inbox Pesan</h2>
          <div className="relative">
            <Search size={16} className="absolute left-3 top-2.5 text-slate-400" />
            <input 
              type="text" placeholder="Cari NIP / Nama..." 
              value={searchQuery}
              onChange={e => setSearchQuery(e.target.value)}
              className="w-full pl-9 pr-4 py-2 bg-slate-50 border border-slate-200 rounded-xl outline-none focus:bg-white focus:border-primary text-sm transition-colors"
            />
          </div>
        </div>

        <div className="flex-1 overflow-y-auto">
          {filteredContacts.length === 0 ? (
            <div className="p-4 text-center text-slate-400 text-sm">Tidak ada kontak ditemukan</div>
          ) : (
            filteredContacts.map(contact => (
              <div 
                key={contact.id}
                onClick={() => setActiveContact(contact)}
                className={`p-4 flex items-center gap-3 cursor-pointer border-b border-slate-50 hover:bg-slate-50 transition-colors ${activeContact?.id === contact.id ? 'bg-blue-50/50' : ''}`}
              >
                <div className="relative">
                  {contact.fotoProfilUrl ? (
                    <img src={contact.fotoProfilUrl} alt={contact.name} className="w-12 h-12 rounded-full object-cover" />
                  ) : (
                    <div className="w-12 h-12 rounded-full bg-slate-200 flex items-center justify-center text-slate-600 font-bold uppercase">
                      {contact.name.charAt(0)}
                    </div>
                  )}
                  {contact.online && <div className="absolute bottom-0 right-0 w-3 h-3 bg-emerald-500 rounded-full border-2 border-white"></div>}
                </div>
                
                <div className="flex-1 min-w-0">
                  <div className="flex justify-between items-baseline mb-1">
                    <h4 className="font-semibold text-slate-800 text-sm truncate">{contact.name}</h4>
                    {contact.time && (
                      <span className="text-xs text-slate-400">
                        {new Date(contact.time).toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' })}
                      </span>
                    )}
                  </div>
                  <p className="text-xs text-slate-500 truncate">{contact.lastMessage || 'Belum ada obrolan'}</p>
                </div>
                
                {contact.unread > 0 && (
                  <div className="w-5 h-5 bg-red-500 rounded-full flex items-center justify-center text-white text-[10px] font-bold">
                    {contact.unread}
                  </div>
                )}
              </div>
            ))
          )}
        </div>
      </div>

      {/* Chat Area */}
      <div className="flex-1 flex flex-col bg-slate-50/50">
        {!activeContact ? (
          <div className="flex-1 flex items-center justify-center text-slate-400 flex-col gap-4">
            <Search size={48} className="opacity-20" />
            <p>Pilih kontak untuk memulai obrolan</p>
          </div>
        ) : (
          <>
            {/* Chat Header */}
            <div className="p-4 bg-white border-b border-slate-200 flex justify-between items-center shadow-sm z-10">
              <div className="flex items-center gap-3">
                <div className="w-10 h-10 rounded-full bg-primary flex items-center justify-center text-white font-bold uppercase">
                  {activeContact.name.charAt(0)}
                </div>
                <div>
                  <h3 className="font-bold text-slate-800">{activeContact.name}</h3>
                  <span className="text-xs text-emerald-600 font-medium">{activeContact.nip}</span>
                </div>
              </div>
              <div className="flex gap-4 text-slate-400">
                <button className="hover:text-primary transition-colors"><Phone size={20} /></button>
                <button className="hover:text-primary transition-colors"><Video size={20} /></button>
                <button className="hover:text-primary transition-colors"><MoreVertical size={20} /></button>
              </div>
            </div>

            {/* Chat Messages */}
            <div className="flex-1 overflow-y-auto p-6 space-y-4">
              {chatHistory.length === 0 ? (
                <div className="text-center text-slate-400 text-sm mt-10">Belum ada riwayat pesan. Kirim pesan sekarang!</div>
              ) : (
                chatHistory.map((msg) => (
                  <div key={msg.id} className={`flex flex-col ${msg.pengirimId === 'admin' ? 'items-end' : 'items-start'}`}>
                    <div 
                      className={`max-w-[70%] px-4 py-2.5 rounded-2xl text-sm shadow-sm ${
                        msg.pengirimId === 'admin' 
                          ? 'bg-primary text-white rounded-br-sm' 
                          : 'bg-white text-slate-700 border border-slate-200 rounded-bl-sm'
                      }`}
                    >
                      {msg.pesan}
                    </div>
                    <span className="text-[10px] text-slate-400 mt-1 mx-1">
                      {new Date(msg.createdAt).toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' })}
                    </span>
                  </div>
                ))
              )}
              <div ref={messagesEndRef} />
            </div>

            {/* Message Input */}
            <div className="p-4 bg-white border-t border-slate-200">
              <form onSubmit={handleSend} className="flex gap-3">
                <input 
                  type="text" 
                  value={msgInput}
                  onChange={(e) => setMsgInput(e.target.value)}
                  placeholder={`Balas ke ${activeContact.name}...`} 
                  className="flex-1 bg-slate-100 border-none rounded-xl px-4 py-3 text-sm outline-none focus:ring-2 focus:ring-primary/20"
                />
                <button 
                  type="submit"
                  disabled={!msgInput.trim()}
                  className="w-12 h-12 bg-primary text-white rounded-xl flex items-center justify-center hover:bg-primary-light transition-colors disabled:opacity-50"
                >
                  <Send size={18} className="ml-1" />
                </button>
              </form>
            </div>
          </>
        )}
      </div>
    </div>
  );
};

export default Inbox;
