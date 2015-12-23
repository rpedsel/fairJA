set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.7353, <2> 24.2438, <3> 22.4536, <4> 23.0409, <5> 22.8717, <6> 24.703, <7> 16.3436, <8> 22.584, <9> 27.7476, <10> 28.2243, <11> 22.7932, <12> 33.0404, <13> 34.3192, <14> 19.8225, <15> 30.9058, <16> 23.974, <17> 34.3454, <18> 22.5372, <19> 24.6884, <20> 37.6283;
param workload[JOB] := <1> 5.3605, <2> 4.9238, <3> 4.7385, <4> 4.8001, <5> 4.7824, <6> 4.9702, <7> 4.0427, <8> 4.7523, <9> 5.2676, <10> 5.3127, <11> 4.7742, <12> 5.7481, <13> 5.8583, <14> 4.4522, <15> 5.5593, <16> 4.8963, <17> 5.8605, <18> 4.7473, <19> 4.9687, <20> 6.1342;
param capacity[MACHINE] := <1> 14.5643, <2> 14.5643, <3> 14.5643, <4> 14.5643, <5> 14.5643, <6> 14.5643, <7> 14.5643;

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
