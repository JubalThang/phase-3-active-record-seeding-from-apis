# Add seed data in this file
puts "Seeding spells..."
#spells to add to the db
spells = ["acid-arrow", "animal-messenger", "calm-emotions", "charm-person"]

#iterate over each spell
spells.each do |spell|

    #make a request to the endpoint for the individual spell
    response = RestClient.get "https://www.dnd5eapi.co/api/spells/#{spell}"

    #the response will come back as a JSON-formatted string.
    #use JSON.parse to convert this string to a Ruby hash:
    spell_hash = JSON.parse(response)

    #create a spell in the database using the data form this hash
    Spell.create(
        name: spell_hash["name"],
        level: spell_hash["level"],
        description: spell_hash["desc"][0]
        #spell_hash["desc"] returns an array, so we need just the first index of the array
    )
end

puts "Done seeding!"