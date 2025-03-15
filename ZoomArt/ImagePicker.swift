import SwiftUI
import UIKit

// UIKit Image Picker intégré dans SwiftUI
struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) private var presentationMode

    // Coordonnées pour l'interaction avec UIKit
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        // Cette fonction est appelée lorsque l'utilisateur a sélectionné une image
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            parent.presentationMode.wrappedValue.dismiss()
        }

        // Cette fonction est appelée lorsque l'utilisateur annule l'opération
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }

    // Crée le coordinateur pour la gestion des interactions
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    // Vue UIKit pour afficher le sélecteur d'images
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    // Fonction requise pour la mise à jour de la vue UIKit
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}
