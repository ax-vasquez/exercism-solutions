defmodule PaintByNumber do

  defp calc_bits_needed(color_count, bits \\ 1)
  defp calc_bits_needed(color_count, bits) do
    if color_count <= (2 ** bits) do
      bits
    else
      calc_bits_needed(color_count, bits + 1)
    end
  end

  def palette_bit_size(color_count) do
    calc_bits_needed(color_count)
  end

  def empty_picture() do
    <<>>
  end

  def test_picture() do
    <<0b00::2, 0b01::2, 0b10::2, 0b11::2>>
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do
    bit_size = palette_bit_size(color_count)
    <<pixel_color_index::size(bit_size), picture::bitstring>>
  end

  def get_first_pixel(picture, _color_count) when picture == <<>>, do: nil
  def get_first_pixel(picture, color_count) do
    bit_size = palette_bit_size(color_count)
    <<first::size(bit_size), _rest::bitstring>> = picture
    first
  end

  def drop_first_pixel(picture, color_count) when picture == <<>>, do: <<>>
  def drop_first_pixel(picture, color_count) do
    bit_size = palette_bit_size(color_count)
    <<_first::size(bit_size), rest::bitstring>> = picture
    rest
  end

  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>>
  end
end
