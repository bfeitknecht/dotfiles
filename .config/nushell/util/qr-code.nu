export def main[
  data: string # Input data
  --size = "2000" # Size of QR code
  --output = "qr.png" # Output file name
  ] {
  curl $"https://api.qrserver.com/v1/create-qr-code/?size=$(size)x$(size)&data=$(data)" --output $output
}
