puts 'Cleaning database...'
Artist.destroy_all
Label.destroy_all

puts 'Creating labels...'
columbia     = Label.create!(name: 'Columbia')
mute_records = Label.create!(name: 'Mute Records')
roadrunner   = Label.create!(name: 'Roadrunner')

puts 'Creating artists...'
# Rock
Artist.create!(
  name: 'Porcupine Tree', genre: 'Rock', label: roadrunner, available: false,
  picture_url: 'https://upload.wikimedia.org/wikipedia/en/c/ce/Pt_deadwing.jpg'
)
# Metal
Artist.create!(
  name: 'Opeth', genre: 'Metal', label: roadrunner, available: true,
  picture_url: 'https://shop.napalmrecords.com/media/catalog/product/cache/1/image/650x/040ec09b1e35df139433887a97daa66f/2/5/25528.jpg'
)
Artist.create!(
  name: 'Iron Maiden', genre: 'Metal',label: columbia, available: false,
  picture_url: 'https://s-media-cache-ak0.pinimg.com/originals/02/86/ab/0286ab666e7e709a34ed9c3a553436df.jpg'
)
# Electronica
Artist.create!(
  name: 'Daft Punk', genre: 'Electronica', label: columbia, available: true,
  picture_url: 'https://a4-images.myspacecdn.com/images03/2/85a286a4bbe84b56a6d57b1e5bd03ef4/300x300.jpg'
)
Artist.create!(
  name: 'Moderat', genre: 'Electronica', label: mute_records, available: true,
  picture_url: 'https://www.residentadvisor.net/images/reviews/2016/moderat-iii.jpg'
)

puts 'Finished!'
