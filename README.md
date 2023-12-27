
# SPI
The serial peripheral interface (SPI) is one of the most widely used interfaces between microcontroller and peripheral ICs such as sensors, ADCs, DACs, shift registers, SRAM, and others. SPI is a synchronous, full duplex master-slave-based interface. The data from the master or the slave is synchronized on the rising or falling clock edge. Both master and slave can transmit data at the same time. The SPI interface can be either 3-wire or 4-wire. 

![App Screenshot](https://embeddedwala.com/uploads/images/202303/img_temp_6421d0f734f258-09489688-86344989.png)

## Implementation of SPI in Verilog
The Verilog implementation reflects a sophisticated RTL design for the SPI protocol. This meticulously engineered architecture encompasses three pivotal modules: the Master, Slave, and the SPI top-level module, serving as the astute Register Interface (RIF) unit.

## Architecture
The initiation of SPI communication necessitates the master to emit the clock signal and designate the slave through the activation of the Chip Select (CS) signal. Typically configured as an active-low signal, the master asserts a logic 0 to select the slave. Notably, SPI operates as a full-duplex interface, enabling concurrent data transmission from both master and slave via the MOSI and MISO lines, respectively.

Throughout SPI communication, data is concurrently transmitted (shifted serially onto the MOSI/SDO bus) and received (sampled or read in from the bus on MISO/SDI). The synchronization of shifting and sampling is orchestrated by the serial clock edge. The SPI interface offers users the flexibility to opt for either the rising or falling edge of the clock to sample and/or shift the data, a feature further detailed in the subsequent section.

![App Screenshot](https://embeddedwala.com/uploads/images/202303/img_temp_64207d4bad0069-44022866-18941375.gif) 


## SPI Mode Selection: Polarity and Clock Phase
The SPI interface, devoid of a predefined data exchange protocol, minimizes overhead, facilitating high-speed data streaming.`Clock polarity (CPOL) and clock phase (CPHA)` parameters, configurable as '0' or '1', yield four distinct modes, enhancing flexibility in master-slave communication. In this particular scenario, both the master and slave operate in Mode 3, which denotes a specific combination of clock polarity and clock phase.


![App Screenshot](https://docs.tizen.org/iot/guides/media/peri_api_spi_mode.png) 


## Data Transmission
### Comprehensive SPI Write Transaction Protocol
In the realm of SPI flash memories, executing a meticulous write to the status register involves a dedicated command designed to accommodate one or two bytes of data. This operation is characterized by a precise protocol:

Initialization: The SPI host initiates the process by activating the slave select line for the designated device, establishing a focused transaction.

Command, Address, and Data Transmission: Subsequently, the master strategically transmits the requisite `8-bit command`, seamlessly followed by the transmission of a `24-bit address` associated with the target status register. This comprehensive transmission primes the system for precise data placement. Following this, the master sends `32 bits of data`detailing the desired status register contents.

Data Handling: Given the unidirectional nature of this transaction, wherein data return is unnecessary, the slave device maintains the MISO line in a high-impedance state. The master adeptly masks any incoming data, streamlining the process.

Transaction Finalization: The transaction concludes with the deliberate de-assertion of the slave select line, symbolizing the successful completion of the comprehensive write operation to the status register.


 ### Comprehensive SPI Read Transaction Protocol
Within the domain of SPI flash memories, executing a comprehensive read of the status register involves a structured command sequence tailored to acquire valuable data from the slave device. This operation adheres to a detailed protocol:

Initialization: The SPI host activates the Slave Select (SS) line, initializing a dedicated transaction for the designated device.

Command, Address, and Data Transmission: Subsequently, the master meticulously transmits the designated `8-bit read status register command`, seamlessly followed by the transmission of a `24-bit address associated with the target status register`. This comprehensive transmission primes the system for precise data retrieval. Following this, the host receives `32 bits of data transmitted by the slave`, providing detailed information from the status register.

Data Handling: The host efficiently captures and interprets the received bitstream, allowing for further analysis or processing of the transmitted data.

Transaction Finalization: Upon completion of data reception, the host concludes the transaction by de-asserting the Slave Select (SS) line, marking the successful culmination of the comprehensive read operation.

![App Screenshot](https://embeddedwala.com/uploads/images/202303/img_temp_6421dddc954f14-18738137-83373518.png) 

## Simulation
This repository also includes a simulation testbench (SPI_tb.v) to assist you in verifying the functionality of the SPI_tb module. You can use this testbench with Verilog simulation tools like GTKWave to observe the module's operation.

### To run the simulation:

Ensure you have a Verilog simulation tool installed.

Compile the SPI.v and SPI_tb.v files.

Run the simulation, and monitor the waveforms to observe the SPI module's behavior.
### Run Locally

Clone the project

```bash
  git clone https://github.com/ZAIN-ALI-02/SPI
```

Go to the project directory

```bash
  cd SPI
```

Install dependencies

```bash
  install vscode
  install GTKWave
  install icarus verilog
```


###  Running Tests

To run tests, run the following command

```bash
  iverilog -o SPI_tb.vvp SPI_tb.v
  vvp SPI_tb.vvp
  GTKWave SPI_tb.vcd
```



## Contributing

Contributions are always welcome, suggestions, and issue reports. Feel free to create pull requests or open issues to help improve this SPI implementation. Together, we can make it even better!

## License
This project is open-source and available under the MIT License. You are free to use, modify, and distribute this code as long as you comply with the terms of the license.

## Documentation

[Documentation](https://en.wikipedia.org/wiki/Serial_Peripheral_Interface)

