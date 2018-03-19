-------------------------------------------------------------------------------
-- lab name: lab_custom_ip
-- component name: my_led_ip
-- author: cas
-- version: 1.0
-- description: simple logic to 
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity lab_led_ip is
  
  generic (
    led_width : integer := 8);          -- 8 LEDs
  port (
    -- clock and reset
    S_AXI_ACLK    : in std_logic;
    S_AXI_ARESETN : in std_logic;
    -- write data channel
    S_AXI_WDATA  : in std_logic_vector(31 downto 0);
    SLV_REG_WREN  : in std_logic;
    -- address channel 
    AXI_AWADDR    : in std_logic_vector(3 downto 0);
    -- my inputs / outputs --
    -- output
    LED           : out std_logic_vector(led_width-1 downto 0)
    );
end entity lab_led_ip;

architecture beh of lab_led_ip is

begin  -- architecture beh

  process(S_AXI_ACLK, S_AXI_ARESETN)
  begin
    if(S_AXI_ARESETN='0')then
      LED <= (others=>'0');
    elsif(rising_edge(S_AXI_ACLK))then
      if(SLV_REG_WREN='1' and AXI_AWADDR="0000") then
        LED <= S_AXI_WDATA(led_width-1 downto 0);
      end if;
    end if;
  end process;
end architecture beh;

-------------------------------------------------------------------------------
-- EOF
-------------------------------------------------------------------------------
