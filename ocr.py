from paddleocr import PaddleOCR

def function_ocr(img_path):
    ocr = PaddleOCR(use_angle_cls=True, lang='en')
    result = ocr.ocr(img_path, cls=True)
    text = ""
    for line in result:
        for word_info in line:
            text += word_info[1][0] + " "
    return text.strip()

image_path = 'C:/Users/world/Documents/Moeez Documents JPEG/cnic_front.jpg'
recognized_text = function_ocr(image_path)
print(recognized_text)