module TenantableC
  extend ActiveSupport::Concern

  private

  def read_with_tenant(&block)
    author = Author.find_by!(slug: request.subdomain)

    ActiveRecord::Base.connected_to(role: :reading, shard: author.slug.to_sym) do
      block.call
    end
  end
end