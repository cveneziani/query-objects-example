RSpec.shared_context 'query object models' do
  let(:awesome_label)   { Label.create!(name: "Awesome Records") }
  let(:flawless_label)  { Label.create!(name: "Flawless-R") }

  let(:opeth)          { Artist.create!(name: "Opeth",          genre: "Metal",       available: true,  label: awesome_label) }
  let(:iron_maiden)    { Artist.create!(name: "Iron Maiden",    genre: "Metal",       available: false, label: awesome_label) }
  let(:daft_punk)      { Artist.create!(name: "Daft Punk",      genre: "Electronics", available: true,  label: flawless_label) }
  let(:britney_spears) { Artist.create!(name: "Britney Spears", genre: "Pop",         available: false, label: flawless_label) }

  let!(:artists) do
    [opeth, iron_maiden, daft_punk, britney_spears]
  end
end
