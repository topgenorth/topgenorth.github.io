--- 
date: "2011-03-17T00:00:00Z"
status: publish 
categories: 
    - Programming 
tags: 
    - Linux 
title: Picking Apart PDF with Ruby and Linux 
type: post 
---

I ran into a curious problem for a side problem of mine where I had some information in PDF files, both text and images.  What I want to do is display the information from the PDF's on a mobile (Android) device.  PDF isn't exactly a mobile friendly format, so I got the idea use HTML.  The next trick then becomes how to get the content out of the PDF's I want into HTML.  Tux to the rescue!

As luck would have the, the utilities pdftotext and pdfimage will allow you to extract your text and images from a PDF (respectively).  pdftotext was even nice enough to extract the text from the PDF and put it into an HTML document for me. (To get these on your Ubuntu box:   sudo apt-get install xpdf-utils).  Once I had these apps installed, I used a bit of Ruby to automate the process - I had 65 PDF's to convert and wasn't crazy about the keystrokes involved for all 65 files.  Net time to do all this was a comfortable couple of hours in front of my TV catching up on the backlog of shows on the PVR.  How is that for multi-tasking?

Here is the Ruby script I wrote.  I welcome suggestions / improvements / enhancements / comments / cash donations / bottles of scotch:

```ruby

#!/usr/bin/ruby
Dir.glob("*.txt") do |file| File.delete(file) end
Dir.glob("*.jpg") do |file| File.delete(file) end
Dir.glob("*.pdf") do |file|
    basename = File.basename(file,'.*')
    if (File.directory?(basename))
        Dir.glob("./#{basename}/*.*") do |file2| File.delete(file2) end
    else
      Dir.mkdir basename unless File.directory?(basename)
    end
    system("pdftotext", "-htmlmeta", file, "./#{basename}/#{basename}.html")
    system("pdfimages", "-j",  file, "./#{basename}/")
    puts "Converted #{file} to text and extracted images to #{basename}."
end
```
