# 👋 Hi, I'm Tejaswini Dev!

A modern, responsive portfolio website built with Flutter, showcasing my journey as a Full Stack Developer. This portfolio features a clean, minimalist design with smooth animations and interactive elements.

## 🎯 About This Portfolio

Welcome to my digital playground! This portfolio showcases my journey as a Full Stack Developer, featuring my expertise in Flutter, Python FastAPI, and modern web technologies. Built with a focus on performance, accessibility, and user experience.

## ✨ What I Bring to the Table

- 🎨 **UI/UX Excellence**: Clean, modern designs with smooth animations
- 📱 **Cross-Platform Development**: Native-like experiences across all devices
- ⚡ **Performance Optimization**: Fast, efficient, and scalable solutions
- 🔒 **Security First**: Best practices in data protection and privacy
- 🚀 **Innovation**: Cutting-edge solutions for complex problems

## 🛠️ Tech Arsenal

### Core Technologies
- **Flutter**: 3.27.3
- **Dart**: 3.6.1
- **Python FastAPI**: Backend development
- **PostgreSQL**: Database management

### Key Packages
- **flutter_animate**: Smooth animations and transitions
- **google_fonts**: Custom typography
- **provider**: State management
- **flutter_svg**: Vector graphics
- **url_launcher**: External link handling
- **shared_preferences**: Local storage

## 💼 Available for Freelance

I'm currently available for freelance projects! Whether you need:
- 🎯 A complete Flutter application
- 🔄 Migration to Flutter
- 🛠️ Technical consulting
- 📱 UI/UX improvements
- 🚀 Performance optimization
- 🚀 Full Stack Developer

Let's discuss your project! [Get in touch](#contact)

## 🚀 Quick Start

```bash
# Clone the repository
git clone https://github.com/yourusername/tejaswini_dev_folio.git

# Navigate to project directory
cd tejaswini_dev_folio

# Install dependencies
flutter pub get

# Run the app
flutter run
```

## 📱 Portfolio Preview

[Add your portfolio screenshots here]

## 🏗️ Project Architecture

```
lib/
├── core/           # Core functionality
│   ├── theme/      # App theming
│   ├── widgets/    # Reusable widgets
│   └── utils/      # Utility functions
├── features/       # Feature modules
│   ├── home/       # Home screen
│   ├── about/      # About section
│   ├── experience/ # Experience showcase
│   ├── projects/   # Project gallery
│   └── contact/    # Contact form
└── main.dart       # Entry point
```

## 🤝 Let's Collaborate

I'm always excited to:
- 💡 Work on interesting projects
- 🤝 Collaborate with other developers
- 🌟 Contribute to open source
- 📚 Share knowledge and learn

---

⭐ If you find this portfolio helpful, consider giving it a star!  
💼 Looking for a Flutter developer or Full Stack Developer? Let's talk about your project!

> "Code is poetry in motion, and I'm here to write beautiful solutions."

## 🚀 Deployment Guide

### Firebase Hosting Setup

1. **Install Firebase CLI**
   ```bash
   npm install -g firebase-tools
   ```

2. **Login to Firebase**
   ```bash
   firebase login
   ```

3. **Initialize Firebase in your project**
   ```bash
   firebase init
   ```
   - Select "Hosting"
   - Choose your Firebase project
   - Set public directory as "build/web"
   - Configure as single-page app: Yes
   - Set up automatic builds: No

4. **Build Flutter Web**
   ```bash
   flutter build web --release
   ```

5. **Deploy to Firebase**
   ```bash
   firebase deploy
   ```

6. **Access Your Site**
   - Your site will be available at: `https://your-project-id.web.app`
   - You can also use: `https://your-project-id.firebaseapp.com`

### Custom Domain Setup (Optional)

1. **Add Custom Domain in Firebase Console**
   - Go to Firebase Console > Hosting
   - Click "Add custom domain"
   - Follow the DNS configuration steps

2. **Update DNS Records**
   - Add the provided TXT records
   - Add the provided A records
   - Wait for DNS propagation (can take up to 48 hours)

3. **Verify Domain**
   - Firebase will automatically verify your domain
   - SSL certificate will be provisioned

### Continuous Deployment (Optional)

1. **Set up GitHub Actions**
   Create `.github/workflows/firebase-hosting.yml`:
   ```yaml
   name: Deploy to Firebase Hosting
   on:
     push:
       branches: [ main ]
   jobs:
     build_and_deploy:
       runs-on: ubuntu-latest
       steps:
         - uses: actions/checkout@v3
         - uses: subosito/flutter-action@v2
         - run: flutter pub get
         - run: flutter build web
         - uses: FirebaseExtended/action-hosting-deploy@v0
           with:
             repoToken: '${{ secrets.GITHUB_TOKEN }}'
             firebaseServiceAccount: '${{ secrets.FIREBASE_SERVICE_ACCOUNT }}'
             channelId: live
             projectId: your-project-id
   ```

2. **Add Firebase Service Account Secret**
   - Go to Project Settings > Service Accounts
   - Generate new private key
   - Add to GitHub repository secrets as `FIREBASE_SERVICE_ACCOUNT`

