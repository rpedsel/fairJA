set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 34.4087, <2> 37.8396, <3> 0.7371, <4> 15.8332, <5> 11.3774, <6> 49.9759, <7> 23.3632, <8> 36.2104, <9> 22.3562, <10> 32.2188, <11> 35.8297, <12> 4.6464, <13> 36.7761, <14> 31.7305, <15> 43.8361, <16> 31.7205, <17> 6.9083, <18> 7.816, <19> 24.0893, <20> 23.9309;
param workload[JOB] := <1> 5.8659, <2> 6.1514, <3> 0.8585, <4> 3.9791, <5> 3.373, <6> 7.0694, <7> 4.8335, <8> 6.0175, <9> 4.7282, <10> 5.6762, <11> 5.9858, <12> 2.1556, <13> 6.0643, <14> 5.633, <15> 6.6209, <16> 5.6321, <17> 2.6284, <18> 2.7957, <19> 4.9081, <20> 4.8919;
param capacity[MACHINE] := <1> 11.9836, <2> 11.9836, <3> 11.9836, <4> 11.9836, <5> 11.9836, <6> 11.9836;

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
