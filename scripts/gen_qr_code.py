import qrcode

img = qrcode.make("https://ryanstreur.com/misc/ryan-streur.vcf")
img.save("contact-qr.png")
