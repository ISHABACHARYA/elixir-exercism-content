defmodule FileSniffer do
  @file_type [
    %{
      type: 'ELF',
      extension: "exe",
      media_type: "application/octet-stream",
      binary_signature: [0x7F, 0x45, 0x4C, 0x46]
    },
    %{
      type: 'BMP',
      extension: "bmp",
      media_type: "image/bmp",
      binary_signature: [0x42, 0x4D]
    },
    %{
      type: 'PNG',
      extension: "png",
      media_type: "image/png",
      binary_signature: [0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A]
    },
    %{
      type: 'JPG',
      extension: "jpg",
      media_type: "image/jpg",
      binary_signature: [0xFF, 0xD8, 0xFF]
    },
    %{
      type: 'GIF',
      extension: "gif",
      media_type: "image/gif",
      binary_signature: [0x47, 0x49, 0x46]
    }
  ]

  def type_from_extension(ext) do
  [media_type] = Enum.filter(@file_type, fn element -> element.extension == ext end)
    Map.fetch!(media_type, :media_type)

  end

  def type_from_binary(file_binary) do
    <<head::binary-size(8), body::binary>> = file_binary
    case head do
      <<0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A>> -> "image/png"
      <<0x7F, 0x45, 0x4C, 0x46, _::binary>> -> "application/octet-stream"
      <<0xFF, 0xD8, 0xFF, _::binary>> -> "image/jpg"
      <<0x47, 0x49, 0x46, _::binary>> -> "image/gif"
      <<0x42, 0x4D, _::binary>> -> "image/bmp"
    end
  end
  def verify(file_binary, extension) do
    if type_from_binary(file_binary) == type_from_extension(extension) do
      {:ok, type_from_extension(extension)}
    else
      {:error, "Warning, file format and file extension do not match."}
    end
  end
end
