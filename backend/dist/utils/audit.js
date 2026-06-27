"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.auditLog = void 0;
const prisma_1 = __importDefault(require("./prisma"));
const auditLog = (action, entityName) => {
    return (req, res, next) => __awaiter(void 0, void 0, void 0, function* () {
        // We capture the original send to log after response is sent
        const originalSend = res.json;
        res.json = function (body) {
            res.locals.responseBody = body;
            return originalSend.call(this, body);
        };
        res.on('finish', () => __awaiter(void 0, void 0, void 0, function* () {
            var _a, _b, _c, _d;
            // Only log successful mutating actions
            if (res.statusCode >= 200 && res.statusCode < 300 && req.method !== 'GET') {
                try {
                    // Attempt to extract user id from decoded token (assuming auth middleware sets it)
                    const userId = ((_a = req.user) === null || _a === void 0 ? void 0 : _a.id) || null;
                    // Determine entity ID from params or response
                    let entityId = req.params.id || ((_c = (_b = res.locals.responseBody) === null || _b === void 0 ? void 0 : _b.data) === null || _c === void 0 ? void 0 : _c.id) || ((_d = res.locals.responseBody) === null || _d === void 0 ? void 0 : _d.id) || 'UNKNOWN';
                    yield prisma_1.default.auditTrail.create({
                        data: {
                            userId,
                            action: `${req.method} ${action}`,
                            entityName,
                            entityId: String(entityId),
                            newData: JSON.stringify(req.body),
                            ipAddress: req.ip,
                            userAgent: req.headers['user-agent']
                        }
                    });
                }
                catch (err) {
                    console.error('Failed to write audit trail:', err);
                }
            }
        }));
        next();
    });
};
exports.auditLog = auditLog;
