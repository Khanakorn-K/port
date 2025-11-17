FROM node:20-alpine
# สร้างไดเรกทอรีแอปพลิเคชันในคอนเทนเนอร์
WORKDIR /app

# คัดลอกไฟล์ package.json และ package-lock.json ไปยังไดเรกทอรี /app ในคอนเทนเนอร์
COPY package*.json /app

RUN npm install -g pnpm

RUN pnpm install
# . ตัวแรกหมายถึงเอาไฟล์ทั้งหมดในไดเรกทอรีปัจจุบัน ไปวางใน /app ที่เป็นไดเรกทอรีเป้าหมายในคอนเทนเนอร์
COPY . /app

# เปิดพอร์ต 3000 สำหรับการเข้าถึงแอปพลิเคชัน 
EXPOSE 3000

# คำสั่งเริ่มต้นเมื่อคอนเทนเนอร์ถูกเรียกใช้ เช่น npm run dev
CMD ["npm", "run", "dev"]