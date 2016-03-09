
module Mindcast

  class MindcastError < StandardError
  end

  # Raised when invalid arguments are passed to a method.
  class ArgumentError < MindcastError; end

  # Raised when a request returns a 400.
  class ClientError < MindcastError; end

  # Raised when a request returns a 401.
  class UnauthorizedError < MindcastError; end

  # Raised when a request returns a 404.
  class NotFoundError < MindcastError; end

  # Raised when a request returns a 500.
  class ServerError < MindcastError; end

  # Raised when there is an unexpected response code / body.
  class UnexpectedResponseError < MindcastError; end

  # Raised when there is an incompatible version of Delphix.
  class VersionError < MindcastError; end

  # Raised when a request times out.
  class TimeoutError < MindcastError; end

  # Raised when login fails.
  class AuthenticationError < MindcastError; end

  # Raised when an IO action fails.
  class IOError < MindcastError; end
  
end
