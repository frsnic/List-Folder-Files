# encoding: UTF-8

$start_folder = "D:/abc/"
$depth = 1

def recursive_folder(folder)
  #puts "== cd #{File.realpath(folder)} =="
  Dir.chdir(folder)
  $depth = $depth + 1
  
  current_files = Dir.entries('.').select { |file| file != '.' && file != '..' && file != '.AppleDouble' && !File.directory?(file) }
  puts "|#{(['-'] * ($depth - 1)).join('')} #{Dir.pwd}" if current_files.length > 0
  current_files.each do |file|
    puts "|#{(['-'] * $depth).join('')} #{file}"
    #puts "#{Dir.pwd}/#{file}"
  end
  
  current_folders = Dir.entries('.').select { |file| file != '.' && file != '..' && file != '.AppleDouble' && File.directory?(file) }
  current_folders.each do |file|
    recursive_folder(file)
  end
  
  Dir.chdir('..')
  $depth = $depth - 1
end

Dir.chdir($start_folder)
recursive_folder($start_folder)
