const http=require('http');
const net = require('net');
const { Server }= require('socket.io');

const server= http.createServer();
const io = new Server(server, {
    cors: { origin:"*"}
});

io.on('connection', socket => {
    console.log('Cliente web conectado:', socket.id);
});

const tcpServer= net.createServer(socket=>{
    socket.on('data', data=>{
        const mensaje= data.toString().trim();
        console.log("mensaje desde php:", mensaje);

        io.emit('mensaje', mensaje);
    });
});
tcpServer.listen(4000, ()=>{
    console.log('Servidor TCP escuchando en puerto 4000');
});

server.listen(3000,() =>{
    console.log('Socket.IO web escuchando en puerto 3000');
});
