set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.1862, <2> 24.663, <3> 22.493, <4> 21.402, <5> 30.0253, <6> 22.7441, <7> 24.2954, <8> 27.3156, <9> 18.9328, <10> 23.9218, <11> 27.8243, <12> 24.6055, <13> 10.0425, <14> 28.2926, <15> 33.3919, <16> 18.4531, <17> 26.8557, <18> 16.5965, <19> 25.2357, <20> 29.3595;
param workload[JOB] := <1> 4.8152, <2> 4.9662, <3> 4.7427, <4> 4.6262, <5> 5.4795, <6> 4.7691, <7> 4.929, <8> 5.2264, <9> 4.3512, <10> 4.891, <11> 5.2749, <12> 4.9604, <13> 3.169, <14> 5.3191, <15> 5.7786, <16> 4.2957, <17> 5.1822, <18> 4.0739, <19> 5.0235, <20> 5.4184;
param capacity[MACHINE] := <1> 97.2922, <2> 97.2922, <3> 97.2922, <4> 97.2922, <5> 97.2922, <6> 97.2922, <7> 97.2922;

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
