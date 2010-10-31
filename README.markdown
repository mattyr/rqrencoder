# RQREncoder

## A Ruby gem for easy QR Code generation, using C for speed

## Install

You'll need libqrencode installed on your machine.

Then, install with Rubygems:

    gem install rqrencoder

## Usage

Create an encoder, and encode away!  The QRCode result contains a grid of bits indicating if a particular square is "dark" (true)

    >> require 'rqrencoder'
    => true
    >> encoder = RQREncoder::QREncoder.new
    => #<RQREncoder::QREncoder>
    >> qrcode = encoder.encode("HELLO")
    => #<RQREncoder::QRCode:0x0000010203b7b0>
    >> qrcode.modules[0][0]
    => true
    >> qrcode.modules[1][5]
    => false

## Author

Matt Robinson
