import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet weak var sepiaButton: UIButton!
    @IBOutlet weak var noirButton: UIButton!
    @IBOutlet weak var vintageButton: UIButton!
    @IBOutlet weak var bloomButton: UIButton!
    @IBOutlet weak var pointillizeButton: UIButton!
    @IBOutlet weak var comicButton: UIButton!
    @IBOutlet weak var woodPrintButton: UIButton!
    @IBOutlet weak var kaleidoscopeButton: UIButton!
    @IBOutlet weak var lineScreenButton: UIButton!
    @IBOutlet weak var spotColorButton: UIButton!

    let context = CIContext()
    var original: UIImage!
    var sepiaButtonChecked = false
    var noirButtonChecked = false
    var vintageButtonChecked = false
    var bloomButtonChecked = false
    var pointillizeButtonChecked = false
    var comicButtonChecked = false
    var woodPrintButtonChecked = false
    var kaleidoscopeButtonChecked = false
    var lineScreenButtonChecked = false
    var spotColorButtonChecked = false

    @IBAction func applySepia() {
        if original == nil {
            return
        }
        sepiaButtonChecked.toggle()
        sepiaButton.isSelected = sepiaButtonChecked
        applyFilters()
    }
    
    @IBAction func applyNoir() {
        if original == nil {
            return
        }
        noirButtonChecked.toggle()
        noirButton.isSelected = noirButtonChecked
        applyFilters()
    }
    
    @IBAction func applyVintage() {
        if original == nil {
            return
        }
        vintageButtonChecked.toggle()
        vintageButton.isSelected = vintageButtonChecked
        applyFilters()
    }
    
    @IBAction func applyBloom() {
        if original == nil {
            return
        }
        bloomButtonChecked.toggle()
        bloomButton.isSelected = bloomButtonChecked
        applyFilters()
    }
    
    @IBAction func applyPointillize() {
       if original == nil {
          return
       }
       pointillizeButtonChecked.toggle()
       pointillizeButton.isSelected = pointillizeButtonChecked
       applyFilters()
    }
    
    @IBAction func applyComic() {
       if original == nil {
          return
       }
       comicButtonChecked.toggle()
       comicButton.isSelected = comicButtonChecked
       applyFilters()
    }
    
    @IBAction func applyEdgeWork() {
       if original == nil {
          return
       }
       woodPrintButtonChecked.toggle()
       woodPrintButton.isSelected = woodPrintButtonChecked
       applyFilters()
    }
    
    @IBAction func applyKaleidoscope() {
       if original == nil {
          return
       }
       kaleidoscopeButtonChecked.toggle()
       kaleidoscopeButton.isSelected = kaleidoscopeButtonChecked
       applyFilters()
    }
    
    @IBAction func applyLineScreen() {
       if original == nil {
          return
       }
       lineScreenButtonChecked.toggle()
       lineScreenButton.isSelected = lineScreenButtonChecked
       applyFilters()
    }
    
    @IBAction func applySpotColor() {
       if original == nil {
          return
       }
       spotColorButtonChecked.toggle()
       spotColorButton.isSelected = spotColorButtonChecked
       applyFilters()
    }
    
    func applyFilters() {
        if original == nil {
            return
        }
        imageView.backgroundColor = UIColor.white
        var image = CIImage(image: original)!
        if sepiaButtonChecked {
            image = sepiaFilter(image: image)
        }
        if noirButtonChecked {
            image = noirFilter(image: image)
        }
        if vintageButtonChecked {
            image = vintageFilter(image: image)
        }
        if bloomButtonChecked {
            image = bloomFilter(image: image)
        }
        if pointillizeButtonChecked {
            image = pointillizeFilter(image: image)
        }
        if comicButtonChecked {
            image = comicFilter(image: image)
        }
        if woodPrintButtonChecked {
            image = edgeWorkFilter(image: image)
            imageView.backgroundColor = UIColor.gray
        }
        if kaleidoscopeButtonChecked {
            image = kaleidoscopeFilter(image: image)
        }
        if lineScreenButtonChecked {
            image = lineScreenFilter(image: image)
        }
        if spotColorButtonChecked {
            image = spotColorFilter(image: image)
        }
        displayCIImage(image: image)
    }
    
    func sepiaFilter(image: CIImage) -> CIImage {
        let filter = CIFilter(name: "CISepiaTone")
        filter?.setValue(image, forKey: kCIInputImageKey)
        filter?.setValue(1.0, forKey: kCIInputIntensityKey)
        return (filter?.outputImage)!
    }
    
    func noirFilter(image: CIImage) -> CIImage {
        let filter = CIFilter(name: "CIPhotoEffectNoir")
        filter?.setValue(image, forKey: kCIInputImageKey)
        return (filter?.outputImage)!
    }

    func vintageFilter(image: CIImage) -> CIImage {
        let filter = CIFilter(name: "CIPhotoEffectProcess")
        filter?.setValue(image, forKey: kCIInputImageKey)
        return (filter?.outputImage)!
    }

    func bloomFilter(image: CIImage) -> CIImage {
        let filter = CIFilter(name: "CIBloom")
        filter?.setValue(image, forKey: kCIInputImageKey)
        filter?.setValue(1.0, forKey: kCIInputIntensityKey)
        filter?.setValue(3, forKey: kCIInputRadiusKey)
        return (filter?.outputImage)!
    }
    
    func pointillizeFilter(image: CIImage) -> CIImage {
        let filter = CIFilter(name: "CIPointillize")
        filter?.setValue(image, forKey: kCIInputImageKey)
        filter?.setValue(10.0, forKey: kCIInputRadiusKey)
        return (filter?.outputImage)!
    }
    
    func comicFilter(image: CIImage) -> CIImage {
        let filter = CIFilter(name: "CIComicEffect")
        filter?.setValue(image, forKey: kCIInputImageKey)
        return (filter?.outputImage)!
    }
    
    func edgeWorkFilter(image: CIImage) -> CIImage {
        let filter = CIFilter(name: "CIEdgeWork")
        filter?.setValue(image, forKey: kCIInputImageKey)
        filter?.setValue(4.0, forKey: kCIInputRadiusKey)
        return (filter?.outputImage)!
    }
    
    func kaleidoscopeFilter(image: CIImage) -> CIImage {
        let filter = CIFilter(name: "CIKaleidoscope")
        filter?.setValue(image, forKey: kCIInputImageKey)
        return (filter?.outputImage)!
    }
    
    func lineScreenFilter(image: CIImage) -> CIImage {
        let filter = CIFilter(name: "CILineScreen")
        filter?.setValue(image, forKey: kCIInputImageKey)
        filter?.setValue(45, forKey: kCIInputAngleKey)
        return (filter?.outputImage)!
    }
    
    func spotColorFilter(image: CIImage) -> CIImage {
        let filter = CIFilter(name: "CISpotColor")
        filter?.setValue(image, forKey: kCIInputImageKey)
        return (filter?.outputImage)!
    }
    
    @IBAction func savePhoto() {
        if original == nil {
            return
        }
        UIImageWriteToSavedPhotosAlbum(imageView.image!, self, #selector(savedImage(_:didFinishSavingWithError:contextInfo:)), nil)
    }

    @IBAction func choosePhoto(_ sender: UIBarButtonItem) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .photoLibrary
            self.navigationController?.present(picker, animated: true, completion: nil)
        }
    }
    
    @objc func savedImage(_ image: UIImage, didFinishSavingWithError error: NSError?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            let ac = UIAlertController(title: "Unable to save photo", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Ok", style: .default))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Saved photo", message: "Your filtered photo has been saved ", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Ok", style: .default))
            present(ac, animated: true)
        }
    }

    func display(filter: CIFilter) {
        let output = filter.outputImage!
        imageView.image = UIImage(cgImage: self.context.createCGImage(output, from: output.extent)!)
    }
    
    func displayCIImage(image: CIImage) {
        imageView.image = UIImage(cgImage: self.context.createCGImage(image, from: image.extent)!)
    }

    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
    ) {
        self.navigationController?.dismiss(animated: true, completion: nil)
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = image
            original = image
            applyFilters()
        }
    }
}
