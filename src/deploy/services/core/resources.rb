# frozen_string_literal: true

module Resources
  attr_accessor :state

  def initialize(state)
    @state = state
  end

  def ecs_cluster
    state.ecs_cluster ||= state.ecs.describe_clusters(
      clusters: [state.config.deploy.aws.ecs.cluster.name],
    ).clusters.first
  end

  def ecs_service
    state.ecs_service ||= state.ecs.describe_services(
      cluster: state.config.deploy.aws.ecs.cluster.name,
      services: [state.config.deploy.aws.ecs.cluster.service.name],
    ).services.first
  end
end
