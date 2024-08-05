import UIKit

// 'NetworkManager' sınıfı, uygulama için ağ işlemlerini yönetir.
final class NetworkManager {
    
    // Singleton örneği, paylaşılan bir örnek üzerinden erişilebilir.
    static let shared = NetworkManager()
    
    // Önbellek, indirilen resimleri tutmak için kullanılır.
    private let cache = NSCache<NSString, UIImage>()
    
    // API'nin temel URL'si ve yemek listesi için özel URL.
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseURL + "appetizers"
    
    // Özel init metodu, sınıfın dışından doğrudan örneğe erişimi sınırlar.
    private init() {}
    
    // API'den yemek listesini alma fonksiyonu.
    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void) {
        guard let url = URL(string: appetizerURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        // URLSession kullanılarak API çağrısı yapılır.
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            // Yanıtın geçerli olduğunu kontrol eder.
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            // Veriyi kontrol eder.
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                // JSON verisini 'AppetizerResponse' modeline çevirir.
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                completed(.success(decodedResponse.request))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        // API çağrısını başlatır.
        task.resume()
    }
    
}
