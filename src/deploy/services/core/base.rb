# frozen_string_literal: true

require './services/core/resources'

module Base
  include Resources

  def initialize(config)
    state = init_state(config)
    super(state)
  end

  private

  def init_state(config)
    client_opts = {
      region: config.deploy.aws.region,
      profile: config.deploy.aws.profile,
    }
    OpenStruct.new(
      ecs: Aws::ECS::Client.new(client_opts),
      config: config,
    )
  end
end
