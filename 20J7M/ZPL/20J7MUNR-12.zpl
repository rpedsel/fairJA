set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 42.6361, <2> 15.644, <3> 40.5761, <4> 2.7006, <5> 33.9949, <6> 23.027, <7> 46.1942, <8> 9.4469, <9> 43.8693, <10> 8.0813, <11> 43.1607, <12> 28.8937, <13> 29.1928, <14> 39.9157, <15> 41.9074, <16> 0.453, <17> 5.7305, <18> 3.1365, <19> 3.1063, <20> 7.7623;
param workload[JOB] := <1> 12.4388, <2> 36.153, <3> 28.0228, <4> 10.539, <5> 25.7166, <6> 38.6805, <7> 45.7742, <8> 14.9254, <9> 15.363, <10> 1.8461, <11> 10.2109, <12> 10.1887, <13> 21.3876, <14> 35.3018, <15> 22.2734, <16> 32.4278, <17> 8.1082, <18> 49.4402, <19> 8.1587, <20> 12.6541;
param capacity[MACHINE] := <1> 439.6108, <2> 439.6108, <3> 439.6108, <4> 439.6108, <5> 439.6108, <6> 439.6108, <7> 439.6108;

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
