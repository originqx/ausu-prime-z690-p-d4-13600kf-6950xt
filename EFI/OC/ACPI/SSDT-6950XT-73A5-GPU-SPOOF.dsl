// You need to change ACPI path to drive your AMD Radeon RX 6950 XT 

DefinitionBlock ("", "SSDT", 2, "hack", "spoof1", 0x00000000)
{
    External (_SB_.PC00.RP05.PXSX, DeviceObj)

    Device (_SB.PC00.RP05.PXSX.PBR0)
    {
        Name (_ADR, Zero)  // _ADR: Address
        Device (GFX1)
        {
            Name (_ADR, Zero)  // _ADR: Address
        }
    }

    Method (_SB.PC00.RP05.PXSX.PBR0.GFX1._DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
    {
        If ((!Arg2 || !_OSI ("Darwin")))
        {
            Return (Buffer (One)
            {
                 0x03                                             // .
            })
        }

        Return (Package (0x02)
        {
            "device-id", 
            Buffer (0x04)
            {
                 0xBF, 0x73, 0x00, 0x00                           // .s..
            }
        })
    }
}

