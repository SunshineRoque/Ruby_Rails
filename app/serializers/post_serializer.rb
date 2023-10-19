class PostSerializer < ActiveModel::Serializer
  attributes :title, :content, :user, :categories

  def user
    { name: object.user.name,
      email: object.user.email,
      id: object.user.id }
  end

  def categories
    object.categories.map do |category|
      { id: category.id,
        name: category.name }
    end
  end
end
