// ContentView.swift dosyası, SwiftUI-Weather projesinin içindeki ContentView adındaki bir SwiftUI View'ını tanımlar.
// Bu dosya, hava durumu uygulamasının ana ekranını tasvir eden bir SwiftUI kullanımını içerir.
// Dosya başlıkları, dosyanın içeriği ve oluşturan kişinin adı gibi bilgileri içerir.

import SwiftUI

// ContentView adında bir SwiftUI View yapısı oluşturulur.
struct ContentView: View {
    
    // isNight adında bir @State özelliği tanımlanır. Bu, gece-gündüz modunu kontrol etmek için kullanılır.
    @State private var isNight = false
    
    // View yapısının ana içeriğini tanımlayan body bloğu.
    var body: some View {
        
        // ZStack, iç içe geçmiş görünümleri oluşturmak için kullanılır.
        ZStack{
            
            // BackgroundView yapısı ile arka plan rengi ve gradienti belirlenir.
            BackgroundView(isNight: isNight)
            
            // VStack, dikey bir düzen oluşturmak için kullanılır.
            VStack{
                
                // CityTextView ile şehir adı görüntülenir.
                CityTextView(cityName: "Cupertino,CA")
                
                // MainWheatherStatusView ile ana hava durumu bilgileri görüntülenir.
                MainWheatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 76)
                
                // HStack, yatay bir düzen oluşturmak için kullanılır. WheatherDayView ile gün bazlı hava durumu bilgileri sıralanır.
                HStack(spacing:20){
                    WheatherDayView(dayOfWeek: "TUE",
                                    imageName: "cloud.sun.fill",
                                    temperature: 74)
                    WheatherDayView(dayOfWeek: "WED",
                                    imageName: "sun.max.fill",
                                    temperature: 88)
                    WheatherDayView(dayOfWeek: "THU",
                                    imageName: "wind.snow",
                                    temperature: 55)
                    WheatherDayView(dayOfWeek: "FRI",
                                    imageName: "sunset.fill",
                                    temperature: 60)
                    WheatherDayView(dayOfWeek: "SAT",
                                    imageName: "snow",
                                    temperature: 25)
                }
                
                // Spacer, boş alan eklemek ve görünümü alt kısma doğru itmek için kullanılır.
                Spacer()
                
                // Button ile gün-gece modunu değiştirmek için bir düğme eklenir.
                Button {
                    isNight.toggle()
                } label:{
                    WeatherButton(title: "Change Day Time", textColor: .white,
                        backgroundColor: .mint)
                }
                
                // Spacer, boş alan eklemek ve görünümü alt kısma doğru itmek için kullanılır.
                Spacer()
            }
        }
    }
}

// Preview bloğu, ContentView'in önizlemesini sağlar. Bu blok, SwiftUI Canvas'te önizleme yapılmasını sağlar.
#Preview {
    ContentView()
}

// WheatherDayView yapısı, gün bazlı hava durumu bilgilerini içerir.
struct WheatherDayView: View {
    var dayOfWeek : String
    var imageName : String
    var temperature : Int
    
    // View yapısının içeriğini tanımlayan body bloğu.
    var body: some View {
        VStack{
            // Gün adını gösteren bir metin eklenir.
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            
            // Hava durumu simgesi eklenir.
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .frame(width:40,height:40)
            
            // Sıcaklık göstergesi eklenir.
            Text("\(temperature)")
                .font(.system(size: 28,weight: .medium))
                .foregroundColor(.white)
            
        }
    }
}

// BackgroundView yapısı, arka plan rengini ve gradientini belirler.
struct BackgroundView: View {
    var isNight:Bool
    
    // View yapısının içeriğini tanımlayan body bloğu.
    var body: some View {
        // ContainerRelativeShape, view'ın içinde bulunduğu konteynırın şeklini alır.
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}

// CityTextView yapısı, şehir adını gösterir.
struct CityTextView: View {
    var cityName : String
    
    // View yapısının içeriğini tanımlayan body bloğu.
    var body: some View {
        Text(cityName)
            .font(.system(size: 32,weight: .medium,design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

// MainWheatherStatusView yapısı, ana hava durumu bilgilerini görüntülemek için kullanılır.
struct MainWheatherStatusView:View {
    var imageName : String
    var temperature: Int
    
    // View yapısının içeriğini tanımlayan body bloğu.
    var body: some View {
        VStack{
            
            // VStack, dikey bir düzen oluşturmak için kullanılır.
            VStack(spacing:10){
                // Hava durumu simgesi eklenir.
                Image(systemName: imageName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:180,height:180)
                
                // Sıcaklık bilgisi eklenir.
                Text("\(temperature)°")
                    .font(.system(size: 76,weight: .medium))
                    .foregroundColor(.white)
            }
            
            // Alt kısma doğru bir boşluk eklenir.
            .padding(.bottom,40)
        }
    }
}

