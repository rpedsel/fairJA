set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.5931, <2> 22.7905, <3> 25.6764, <4> 23.7503, <5> 27.0112, <6> 29.6735, <7> 29.1907, <8> 19.8991, <9> 22.5708, <10> 24.5281, <11> 24.5151, <12> 28.8308, <13> 20.9925, <14> 24.9125, <15> 34.392, <16> 33.1879, <17> 21.088, <18> 22.2166, <19> 26.2313, <20> 20.3204;
param workload[JOB] := <1> 424.0758, <2> 519.4069, <3> 659.2775, <4> 564.0768, <5> 729.6049, <6> 880.5166, <7> 852.097, <8> 395.9742, <9> 509.441, <10> 601.6277, <11> 600.9901, <12> 831.215, <13> 440.6851, <14> 620.6327, <15> 1182.8097, <16> 1101.4367, <17> 444.7037, <18> 493.5773, <19> 688.0811, <20> 412.9187;
param capacity[MACHINE] := <1> 1850.4498, <2> 1850.4498, <3> 1850.4498, <4> 1850.4498, <5> 1850.4498, <6> 1850.4498, <7> 1850.4498;

var x[JM];
var z;
maximize minBenefit: z;
subto Z:
   forall <m> in MACHINE do
      sum <j> in JOB : benefit[j] * x[j,m] >= z;
subto K:
   forall <m> in MACHINE do
      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];
subto X:
   forall <j> in JOB do
      sum <m> in MACHINE : x[j,m] <= 1;
subto A:
   forall <j,m> in JM do
      x[j,m] >= 0;