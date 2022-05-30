defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [:nickname, battery_percentage: 100, distance_driven_in_meters: 0]

  def new(nickname \\ "none"), do: %RemoteControlCar{nickname: nickname}

  def display_distance(%RemoteControlCar{
        distance_driven_in_meters: distance
      }),
      do: "#{distance} meters"

  def display_battery(%RemoteControlCar{
        battery_percentage: 0
      }),
      do: "Battery empty"

  def display_battery(%RemoteControlCar{
        battery_percentage: percentage
      }),
      do: "Battery at #{percentage}%"

  def drive(
        %RemoteControlCar{
          battery_percentage: 0
        } = remote_car
      ),
      do: remote_car

  def drive(
        %RemoteControlCar{
          battery_percentage: percentage,
          distance_driven_in_meters: distance
        } = remote_car
      ),
      do: %{
        remote_car
        | distance_driven_in_meters: distance + 20,
          battery_percentage: percentage - 1
      }
end
