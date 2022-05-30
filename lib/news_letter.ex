defmodule NewsLetter do
  def read_emails(file_path) do
    {:ok, file} = File.open(file_path, [:read])
    file_content = IO.read(file, :eof)

    if(is_binary(file_content)) do
      []
    else
      file_content |> String.trim() |> String.split("\n")
    end
  end

  def open_log(file_path) do
    {:ok, io_device} = File.open(file_path)
    io_device
  end

  def log_sent_email(pid, email) do
    IO.puts(pid, email)
  end

  def close_log(pid) do
    File.close(pid)
  end

  def send_newsletter(email_file, log_file, send_email) do
    log_pid = open_log(log_file)

    read_emails(email_file)
    |> Enum.map(fn email ->
      if send_email.(email) == :ok, do: log_sent_email(log_pid, email)
    end)

    close_log(log_pid)
  end
end
