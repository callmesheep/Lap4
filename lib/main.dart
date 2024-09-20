import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Màn hình đăng nhập
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Các controller để lưu trữ dữ liệu đầu vào
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();

  // Biến để lưu trữ trạng thái xác thực
  bool isAuthenticated = false;

  // Hàm xác thực
  void authenticateUser() {
    String username = usernameController.text;
    String password = passwordController.text;
    String pincode = pincodeController.text;

    // Điều kiện kiểm tra xác thực
    if (username == 'admin' && password == '1234' && pincode == '5678') {
      setState(() {
        isAuthenticated = true;
      });
      // Điều hướng sang trang Dashboard
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DashboardScreen()),
      );
    } else {
      // Hiển thị thông báo lỗi nếu xác thực thất bại
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Thông tin xác thực không chính xác!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đăng Nhập'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child:
        Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),

            ),
            SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),

              obscureText: true, // Ẩn ký tự mật khẩu
            ),
            SizedBox(height: 16),
            TextField(
              controller: pincodeController,
              decoration: InputDecoration(
                labelText: 'Pincode',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: authenticateUser,
              child: Text('Đăng Nhập'),
            ),
          ],
        ),
      ),

    );
  }
}

// Màn hình Dashboard sau khi đăng nhập thành công
class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NOTE BOOK',style: GoogleFonts.roboto(fontSize:16)),
      ),
      body: Center(
        child: Text(
          'Hello!',
          style: GoogleFonts.pinyonScript(fontSize: 50),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LoginScreen()
      ),

  );
}