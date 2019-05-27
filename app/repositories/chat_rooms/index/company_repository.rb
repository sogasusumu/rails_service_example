module ChatRooms::Index::CompanyRepository
  include Contracts::Core
  include Contracts::Builtin

  Contract nil => ArrayOf[Hash]
  def build_response
    chat_rooms.map do |chat_room|
      chat_room.extend(ChatRooms::Index::ChatRoomRepository).build_response
    end
  end
end
