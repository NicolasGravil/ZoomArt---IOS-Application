import SwiftUI

struct UploadContentView: View {
    @State private var uploadedImages: [(image: UIImage, text: String)] = []
    @State private var selectedImage: UIImage?
    @State private var showImagePicker = false
    @State private var showTextInput = false
    @State private var newText = ""
    @State private var showImageDetail = false
    @State private var selectedImageDetail: (image: UIImage, text: String)?

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                // Button to open image picker
                Button(action: {
                    showImagePicker.toggle()
                }) {
                    Image(systemName: "photo.badge.plus")
                        .font(.largeTitle)
                        .frame(width: 150, height: 150)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .shadow(radius: 10)
                }
                .padding(30)
                .sheet(isPresented: $showImagePicker) {
                    MyImagePicker(image: $selectedImage)
                }
                
                // Display uploaded images in a grid
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(uploadedImages, id: \.image) { imageInfo in
                            VStack {
                                Image(uiImage: imageInfo.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 100)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .onTapGesture {
                                        selectedImageDetail = imageInfo
                                        showImageDetail.toggle()
                                    }
                                
                                Text(imageInfo.text)
                                    .font(.caption)
                                    .multilineTextAlignment(.center)
                            }
                            .swipeActions {
                                Button(role: .destructive) {
                                    if let index = uploadedImages.firstIndex(where: { $0.image == imageInfo.image }) {
                                        uploadedImages.remove(at: index)
                                    }
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                        }
                    }
                    .padding()
                }
                Spacer()
            }
            .navigationTitle("Publier")
            
            // Sheet for text input after image selection
            .sheet(isPresented: $showTextInput) {
                VStack {
                    Text("Ajouter un titre")
                        .font(.headline)
                        .padding()
                    
                    TextField("Entrez un titre", text: $newText)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                        .padding()
                    
                    Button(action: {
                        if !newText.isEmpty, let newImage = selectedImage {
                            uploadedImages.append((image: newImage, text: newText))
                            newText = ""
                            selectedImage = nil
                            showTextInput.toggle()
                        }
                    }) {
                        Text("Partager")
                            .font(.headline)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .disabled(newText.isEmpty)
                    
                    Spacer()
                }
                .padding()
            }
            
            // Updated onChange to handle changes in selectedImage
            .onChange(of: selectedImage) { _, newImage in
                if newImage != nil {
                    showTextInput = true
                }
            }

            
            // Sheet to view image details
            .sheet(isPresented: $showImageDetail) {
                if let imageDetail = selectedImageDetail {
                    VStack {
                        Image(uiImage: imageDetail.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity)
                            .padding()
                        
                        Text(imageDetail.text)
                            .font(.headline)
                            .padding()
                        
                        Spacer()
                    }
                    .padding()
                }
            }
        }
    }
}

// Custom ImagePicker using UIViewControllerRepresentable
struct MyImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: MyImagePicker
        
        init(_ parent: MyImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }
            picker.dismiss(animated: true)
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
    }
}

#Preview {
    UploadContentView()
}
