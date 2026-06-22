# Reminder

# Reminder

Basit ve fonksiyonel bir görev/hatırlatıcı (reminder) uygulaması. Kullanıcılar görev ekleyebilir, tamamladıkları görevleri işaretleyebilir ve tüm verileri cihazda saklanır.

## 🛠 Kullanılan Teknolojiler

- **Swift**
- **UIKit**
- **Storyboard** (Auto Layout ile)
- **MVVM** 
- **UserDefaults** 
- **UICollectionView** 

## 🎥 Ekran Kaydı

> Buraya ekran kaydını GIF veya video olarak ekleyebilirsin.
>
> Örnek: `![Demo](demo.gif)`

## ✨ Özellikler

- 📋 Görev listesi — eklenen görevler `Today's Reminders` altında listelenir
- ➕ Yeni görev ekleme — sağ alttaki `+` butonu ile yeni görev oluşturma ekranı açılır
- ✅ Görev tamamlama — checkbox'a basarak görevler tamamlanmış olarak işaretlenir, üzeri çizilir
- 📅 Dinamik tarih navigasyonu — dün / bugün / yarın tarihleri otomatik hesaplanır ve gösterilir
- 🌅 Dinamik selamlama — saate göre "Good Morning / Afternoon / Evening / Night" mesajı değişir
- 💾 Kalıcı veri saklama — eklenen görevler `UserDefaults` ile cihazda saklanır, uygulama yeniden açıldığında kaybolmaz
- 🎹 Klavye yönetimi — görev ekleme ekranında klavye otomatik açılır, ekrana dokununca kapanır

## 🏗 Mimari

Proje **MVVM (Model-View-ViewModel)** mimarisiyle geliştirilmiştir:

```
Reminder/
├── Model/
│   └── ReminderModel.swift
├── Screens/
│   ├── ReminderList/
│   │   ├── ReminderListViewController.swift
│   │   ├── ReminderListViewModel.swift
│   │   ├── ReminderCell.swift
│   │   └── ReminderHeader.swift
│   └── AddReminder/
│       ├── AddReminderViewController.swift
│       └── AddReminderViewModel.swift
└── Resources/
    └── Assets.xcassets
```

- **Model** → Verinin yapısını tanımlar (`ReminderModel`)
- **ViewModel** → İş mantığını yönetir (ekleme, tamamlama, kaydetme/okuma, tarih/saat hesaplama)
- **View/Controller** → Storyboard ile tasarlanan ekranları ve kullanıcı etkileşimini yönetir
