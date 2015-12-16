set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.0042, <2> 15.5314, <3> 27.2936, <4> 21.6969, <5> 20.2716, <6> 30.7998, <7> 29.4685, <8> 21.7134, <9> 18.7604, <10> 30.0475, <11> 29.9891, <12> 24.0135, <13> 26.9857, <14> 31.8154, <15> 28.7967, <16> 22.9111, <17> 25.8446, <18> 24.6597, <19> 20.5044, <20> 24.5689;
param workload[JOB] := <1> 4.6909, <2> 3.941, <3> 5.2243, <4> 4.658, <5> 4.5024, <6> 5.5498, <7> 5.4285, <8> 4.6598, <9> 4.3313, <10> 5.4816, <11> 5.4762, <12> 4.9004, <13> 5.1948, <14> 5.6405, <15> 5.3663, <16> 4.7866, <17> 5.0838, <18> 4.9659, <19> 4.5282, <20> 4.9567;
param capacity[MACHINE] := <1> 16.5612, <2> 16.5612, <3> 16.5612, <4> 16.5612, <5> 16.5612, <6> 16.5612;

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
