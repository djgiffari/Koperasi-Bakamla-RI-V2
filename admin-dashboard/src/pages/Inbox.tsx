import React, { useState } from 'react';
import { Search, Send, MoreVertical, Phone, Video } from 'lucide-react';

const contacts = [
  { id: 1, name: 'Budi Santoso', lastMessage: 'Terima kasih informasinya min.', time: '10:45', unread: 0, online: true },
  { id: 2, name: 'Siti Aminah', lastMessage: 'Bisa minta tolong cek pinjaman saya?', time: '09:20', unread: 2, online: false },
  { id: 3, name: 'Agus Pratama', lastMessage: 'Kapan uang simpanan bisa ditarik?', time: 'Kemarin', unread: 0, online: true },
];

const messages = [
  { id: 1, sender: 'member', text: 'Halo Admin, selamat pagi.', time: '10:30' },
  { id: 2, sender: 'admin', text: 'Selamat pagi Pak Budi. Ada yang bisa kami bantu?', time: '10:35' },
  { id: 3, sender: 'member', text: 'Saya mau tanya syarat pembaruan data anggota.', time: '10:38' },
  { id: 4, sender: 'admin', text: 'Untuk pembaruan data, Bapak bisa langsung mengisi form di aplikasi mobile menu Profil, atau datang ke kantor Koperasi.', time: '10:42' },
  { id: 5, sender: 'member', text: 'Terima kasih informasinya min.', time: '10:45' },
];

const Inbox: React.FC = () => {
  const [activeContact, setActiveContact] = useState(contacts[0]);
  const [msgInput, setMsgInput] = useState('');
  const [chatHistory, setChatHistory] = useState(messages);

  const handleSend = (e: React.FormEvent) => {
    e.preventDefault();
    if (!msgInput.trim()) return;
    
    const newMsg = {
      id: chatHistory.length + 1,
      sender: 'admin',
      text: msgInput,
      time: new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' })
    };
    
    setChatHistory([...chatHistory, newMsg]);
    setMsgInput('');
  };

  return (
    <div className="h-[calc(100vh-140px)] flex bg-white/50 backdrop-blur-md border border-slate-200 rounded-2xl overflow-hidden shadow-sm">
      {/* Sidebar Contacts */}
      <div className="w-80 border-r border-slate-200 bg-white flex flex-col hidden md:flex">
        <div className="p-4 border-b border-slate-100">
          <h2 className="text-xl font-bold text-primary font-outfit mb-4">Inbox Pesan</h2>
          <div className="relative">
            <Search size={16} className="absolute left-3 top-2.5 text-slate-400" />
            <input 
              type="text" placeholder="Cari pesan..." 
              className="w-full pl-9 pr-4 py-2 bg-slate-50 border border-slate-200 rounded-xl outline-none focus:bg-white focus:border-primary text-sm transition-colors"
            />
          </div>
        </div>

        <div className="flex-1 overflow-y-auto">
          {contacts.map(contact => (
            <div 
              key={contact.id}
              onClick={() => setActiveContact(contact)}
              className={`p-4 flex items-center gap-3 cursor-pointer border-b border-slate-50 hover:bg-slate-50 transition-colors ${activeContact.id === contact.id ? 'bg-blue-50/50' : ''}`}
            >
              <div className="relative">
                <div className="w-12 h-12 rounded-full bg-slate-200 flex items-center justify-center text-slate-600 font-bold">
                  {contact.name.charAt(0)}
                </div>
                {contact.online && <div className="absolute bottom-0 right-0 w-3 h-3 bg-emerald-500 rounded-full border-2 border-white"></div>}
              </div>
              
              <div className="flex-1 min-w-0">
                <div className="flex justify-between items-baseline mb-1">
                  <h4 className="font-semibold text-slate-800 text-sm truncate">{contact.name}</h4>
                  <span className="text-xs text-slate-400">{contact.time}</span>
                </div>
                <p className="text-xs text-slate-500 truncate">{contact.lastMessage}</p>
              </div>
              
              {contact.unread > 0 && (
                <div className="w-5 h-5 bg-red-500 rounded-full flex items-center justify-center text-white text-[10px] font-bold">
                  {contact.unread}
                </div>
              )}
            </div>
          ))}
        </div>
      </div>

      {/* Chat Area */}
      <div className="flex-1 flex flex-col bg-slate-50/50">
        {/* Chat Header */}
        <div className="p-4 bg-white border-b border-slate-200 flex justify-between items-center shadow-sm z-10">
          <div className="flex items-center gap-3">
            <div className="w-10 h-10 rounded-full bg-primary flex items-center justify-center text-white font-bold">
              {activeContact.name.charAt(0)}
            </div>
            <div>
              <h3 className="font-bold text-slate-800">{activeContact.name}</h3>
              <span className="text-xs text-emerald-600 font-medium">{activeContact.online ? 'Online' : 'Offline'}</span>
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
          {chatHistory.map((msg) => (
            <div key={msg.id} className={`flex flex-col ${msg.sender === 'admin' ? 'items-end' : 'items-start'}`}>
              <div 
                className={`max-w-[70%] px-4 py-2.5 rounded-2xl text-sm shadow-sm ${
                  msg.sender === 'admin' 
                    ? 'bg-primary text-white rounded-br-sm' 
                    : 'bg-white text-slate-700 border border-slate-200 rounded-bl-sm'
                }`}
              >
                {msg.text}
              </div>
              <span className="text-[10px] text-slate-400 mt-1 mx-1">{msg.time}</span>
            </div>
          ))}
        </div>

        {/* Message Input */}
        <div className="p-4 bg-white border-t border-slate-200">
          <form onSubmit={handleSend} className="flex gap-3">
            <input 
              type="text" 
              value={msgInput}
              onChange={(e) => setMsgInput(e.target.value)}
              placeholder="Ketik pesan balasan..." 
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
      </div>
    </div>
  );
};

export default Inbox;
