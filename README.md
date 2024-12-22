# Modeling a Turbofan Engine
This repository contains an assignment for the **Heat Engines (ME474)** course at Bogazici University, Mechanical Engineering Department. 
This assignment includes simple program to calculate the specific thrust developed of a turbofan engine designed for a cruise condition.

---

## Problem Description

Data for a turbofan, designed to operate for a certain cruise condition, are provided. A simple two-spool configuration with mixed exhaust is used. A simple schematic representation 
of the turbofan indicating the states is given below:

<p align="center">
  <img src="https://github.com/user-attachments/assets/2465f783-6d47-4cf6-978c-d8b322019faf" alt="Turbofan Schematic" width="600">
</p>

---

## Model Inputs and Constants

The turbofan engine parameters are defined as follows:

<p align="center">
  <img src="https://github.com/user-attachments/assets/f9613ef0-3ae6-45bd-8476-31eed042367a" alt="Engine Parameters" width="450">
</p>

The constants are defined as follows:

<p align="center">
  <img src="https://github.com/user-attachments/assets/0a1329e0-cd81-4795-8253-c1b6b4fd5a3f" alt="Constants" width="500">
</p>

Using the k and c<sub>p</sub> values, the R values are calculated as follows:

<p align="center">
  <img src="https://github.com/user-attachments/assets/18b93087-21e9-46c4-ba93-aa72ce5c96d9" alt="Gas Constant Calculation" width="400">
</p>

---
## Task

The goal of this project is to calculate the specific thrust developed by a turbofan engine under specified cruise conditions and to determine the relevant area ratios. The project involves the following steps:

**Program Development**:
   Using the given parameters:
   
   - Write a MATLAB program to calculate the specific thrust for the given turbofan engine data.
   - Implement calculations considering a Mach number of 0.5 at state 6.
   - Include functionality to compute relevant area ratios within the MATLAB program.

This project combines thermodynamic principles with computational modeling, enabling the analysis of turbofan performance under specified operating conditions.


---

## Mathematical Model

In this section, the governing equations and relationships for a turbofan and its respective stages are presented in a structured manner. The calculations proceed as follows:

### Stagnation Conditions at the Intake (State 01)

- The stagnation temperature is determined using:
  <p align="center">
    <img src="https://github.com/user-attachments/assets/2122b85f-bf6b-4ca3-a83c-0b7ee6da2707" alt="Stagnation Temperature Equation" width="400">
  </p>

- Here, the velocity of the intake air is computed as:
  <p align="center">
    <img src="https://github.com/user-attachments/assets/890a1dab-5066-4880-aa0e-27feaf7ff47b" alt="Velocity Equation" width="400">
  </p>

- The stagnation pressure is calculated as:
  <p align="center">
    <img src="https://github.com/user-attachments/assets/62849442-8360-42e7-a5c4-1c80cd7af6a4" alt="Stagnation Pressure Equation" width="400">
  </p>

---

### Cold and Hot Streams (States 02 and 03)

- The stagnation pressures and temperatures of the cold and hot streams are given by:
  <p align="center">
    <img src="https://github.com/user-attachments/assets/4416d6c0-3900-406f-b828-cb4463eca84d" alt="Cold Stream Temperature" width="400">
  </p>
  <p align="center">
    <img src="https://github.com/user-attachments/assets/f67ae699-4cec-4149-a2c2-7bd6102cc7d3" alt="Cold Stream Pressure" width="400">
  </p>
  <p align="center">
    <img src="https://github.com/user-attachments/assets/308beace-0fe3-464e-a6b1-3439f5b14acf" alt="Hot Stream Temperature" width="400">
  </p>
  <p align="center">
    <img src="https://github.com/user-attachments/assets/77d794b7-344b-4536-8ee1-7130d00634d9" alt="Hot Stream Pressure" width="400">
  </p>

- In this context, (poly,comp) represents the polytropic compression efficiency, which is defined as:
  <p align="center">
    <img src="https://github.com/user-attachments/assets/5584c431-452e-47ce-8eb7-28ab9ab590bc" alt="Polytropic Compression" width="400">
  </p>

---

### Turbine Stages (States 04, 05, and 06)

- The stagnation pressure before the turbine is calculated as:
  <p align="center">
    <img src="https://github.com/user-attachments/assets/b966e73b-a1a3-4834-bb5d-f7c41a77f1f4" alt="Turbine Stagnation Pressure" width="400">
  </p>

- To satisfy the work requirements of the high-pressure and low-pressure rotors, the following relations are used:
  <p align="center">
    <img src="https://github.com/user-attachments/assets/d9a45533-1b88-4c72-a5f8-cb9dd8ba7683" alt="HP Rotor Work" width="400">
  </p>
  <p align="center">
    <img src="https://github.com/user-attachments/assets/2d43738e-cb1c-4dfa-80be-f016e5a01708" alt="LP Rotor Work" width="400">
  </p>

- The stagnation pressures after the turbines are given by:
  <p align="center">
    <img src="https://github.com/user-attachments/assets/4fd1ad93-1f73-47c1-ab45-46222ed6f1a7" alt="Turbine Stagnation Pressure 1" width="400">
  </p>

- In this context, (poly,comp) represents the polytropic compression efficiency, which is defined as:
  <p align="center">
    <img src="https://github.com/user-attachments/assets/9ba27e31-cf33-4294-b65b-e298c5a9f945" alt="Polytropic Expansion" width="400">
  </p>

---

### State 6: Pressure, Temperature, and Velocity

- The mass flow rates for the cold and hot streams are determined using the following equations. The total mass flow rate is assumed to be 1 kg/s since specific thrust is required:
  <p align="center">
    <img src="https://github.com/user-attachments/assets/6ba4c82a-a4dd-43ca-a2b5-7f97d79893d1" alt="Cold Stream Mass Flow" width="400">
  </p>
  <p align="center">
    <img src="https://github.com/user-attachments/assets/ceb799a4-3364-419c-a1ab-191fa8a491e3" alt="Hot Stream Mass Flow" width="400">
  </p>

- The pressure, temperature, and velocity at state 6 are calculated using:
  <p align="center">
    <img src="https://github.com/user-attachments/assets/98b38817-aafb-4fa9-9e63-19fa59abba4b" alt="Pressure at State 6" width="400">
  </p>
  <p align="center">
    <img src="https://github.com/user-attachments/assets/5004f00b-c199-450d-b313-3cf3a64ae422" alt="Temperature at State 6" width="400">
  </p>
  <p align="center">
    <img src="https://github.com/user-attachments/assets/e611c2d1-a5aa-41de-80da-b6da8b141f7c" alt="Velocity at State 6" width="400">
  </p>

- Using ideal gas relations, the area at state 6 is determined as:
  <p align="center">
    <img src="https://github.com/user-attachments/assets/6eb0194b-55d0-42f7-8de9-2fa59f6c04e8" alt="Area Calculation" width="400">
  </p>
  <p align="center">
    <img src="https://github.com/user-attachments/assets/183a9906-9039-450a-9313-d22e76be6183" alt="Gas Relation for Area" width="400">
  </p>

---

### State 2: Mach Number and Properties

- The Mach number at state 2 is calculated as:
  <p align="center">
    <img src="https://github.com/user-attachments/assets/9b14b4ec-ed82-417d-bcfd-3beaf443db92" alt="Mach Number Calculation" width="400">
  </p>

- Subsequently, additional variables at state 2 are derived using:
  <p align="center">
    <img src="https://github.com/user-attachments/assets/e751dce1-15c3-419d-bbdc-24141c4ba026" alt="Static Temperature at State 2" width="400">
  </p>
  <p align="center">
    <img src="https://github.com/user-attachments/assets/7a24c500-9b9d-474e-84e8-73afe1194214" alt="Density at State 2" width="400">
  </p>
  <p align="center">
    <img src="https://github.com/user-attachments/assets/5f0c09ce-6a68-4962-91bc-193ac7e3258f" alt="Velocity at State 2" width="400">
  </p>
  <p align="center">
    <img src="https://github.com/user-attachments/assets/6fd75da6-ac26-463d-9163-dd6f93c1093a" alt="Other Variables at State 2" width="400">
  </p>

---

### Mixture Properties and Momentum

- The thermodynamic constants of the mixture are computed as:
  <p align="center">
    <img src="https://github.com/user-attachments/assets/01a52961-0add-4fa0-8414-9edda6943631" alt="Mixture Specific Heat" width="400">
  </p>
  <p align="center">
    <img src="https://github.com/user-attachments/assets/68246fc1-b085-4073-b94b-4ee103e1311d" alt="Mixture Gas Constant" width="400">
  </p>
  <p align="center">
    <img src="https://github.com/user-attachments/assets/79411a45-0311-4784-a0e7-7a9320463dcb" alt="Mixture Specific Heat Ratio" width="400">
  </p>

- The stagnation temperature of the mixture is determined as:
  <p align="center">
    <img src="https://github.com/user-attachments/assets/a1dd209c-841e-40ef-baba-f80e11cc5615" alt="Mixture Stagnation Temperature" width="400">
  </p>

- Momentum is calculated using:
  <p align="center">
    <img src="https://github.com/user-attachments/assets/baa984a5-aa55-4474-8f3a-2865e7e1b816" alt="Momentum Calculation" width="400">
  </p>

- The momentum balance equation is written as:
  <p align="center">
    <img src="https://github.com/user-attachments/assets/57739f54-504f-44ab-9590-6178914c08ad" alt="Momentum Balance" width="400">
  </p>

- Different values of Mach numbers for the mixture are iterated to determine the correct values of p<sub>m</sub> and C<sub>m</sub> until momentum balance is achieved. Initially, a guess is made for the Mach number, and then the static temperature, pressure, and velocity of the mixture are computed:
  <p align="center">
    <img src="https://github.com/user-attachments/assets/7f6bef56-9104-46af-942e-a06736c8a233" alt="Static Temperature" width="400">
  </p>
  <p align="center">
    <img src="https://github.com/user-attachments/assets/8ecca444-9f74-4f4d-a654-12cad9f061f3" alt="Static Pressure" width="400">
  </p>
  <p align="center">
    <img src="https://github.com/user-attachments/assets/df91e616-becd-4bcc-8d38-05af66a47e16" alt="Velocity of Mixture" width="400">
  </p>

- The iteration continues until the desired tolerance is met.

- The stagnation pressure of the mixture is calculated as:
  <p align="center">
    <img src="https://github.com/user-attachments/assets/b3886bcb-5348-45f3-ae63-f0b97fd9bf2c" alt="Stagnation Pressure of Mixture" width="400">
  </p>

---

### Nozzle and Specific Thrust (State 7)


- The nozzle pressure ratio is compared with the critical pressure ratio to determine whether the flow is choked or unchoked:
  <p align="center">
    <img src="https://github.com/user-attachments/assets/df306311-0b20-45a4-baae-5e9b3e20bbb0" alt="Nozzle Pressure Ratio" width="400">
  </p>

- Since the flow is determined to be choked, the following equations are used to compute the variables at state 7:
  <p align="center">
    <img src="https://github.com/user-attachments/assets/42d5df35-76b7-4cac-b7ca-2a94c93bcd68" alt="State 7 Pressure" width="400">
  </p>
  <p align="center">
    <img src="https://github.com/user-attachments/assets/5b080039-f4f5-410c-aaba-08830a18c6b5" alt="State 7 Temperature" width="400">
  </p>
  <p align="center">
    <img src="https://github.com/user-attachments/assets/5a5eeb9b-13b4-41ac-ad0b-a00d678e6e3c" alt="State 7 Velocity" width="400">
  </p>
  <p align="center">
    <img src="https://github.com/user-attachments/assets/a0ba9098-107f-407d-9ed9-1eba4365ce3b" alt="State 7 Area" width="400">
  </p>
  <p align="center">
    <img src="https://github.com/user-attachments/assets/bb2974d0-a95b-4a64-b388-89d52805da97" alt="State 7 Mach Number" width="400">
  </p>

- Finally, the specific thrust is calculated as:
  <p align="center">
    <img src="https://github.com/user-attachments/assets/6f6bb1a8-0a75-4f33-8792-1630bddf356f" alt="Specific Thrust" width="400">
  </p>

---

## Repository Structure

This repository is organized as follows:

1. **`report/`**: Contains the detailed report explaining the turbofan modeling process, mathematical formulations, and analysis of the results.

2. **`src/`**: Contains MATLAB scripts for modeling and analyzing the turbofan system, including the calculation of thermodynamic states, efficiencies, and performance metrics.

3. **`README.md`**: Provides an overview of the project, objectives, and instructions for running the MATLAB scripts and interpreting the results.
