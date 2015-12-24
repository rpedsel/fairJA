set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 17.411, <2> 38.22, <3> 17.575, <4> 11.0526, <5> 3.916, <6> 47.5373, <7> 24.5379, <8> 35.0467, <9> 23.844, <10> 34.9759, <11> 43.6403, <12> 42.8453, <13> 47.064, <14> 29.0283, <15> 13.2818, <16> 16.8984, <17> 15.3675, <18> 34.5998, <19> 35.1623, <20> 6.2412;
param workload[JOB] := <1> 17.411, <2> 38.22, <3> 17.575, <4> 11.0526, <5> 3.916, <6> 47.5373, <7> 24.5379, <8> 35.0467, <9> 23.844, <10> 34.9759, <11> 43.6403, <12> 42.8453, <13> 47.064, <14> 29.0283, <15> 13.2818, <16> 16.8984, <17> 15.3675, <18> 34.5998, <19> 35.1623, <20> 6.2412;
param capacity[MACHINE] := <1> 57.6692, <2> 57.6692, <3> 57.6692, <4> 57.6692, <5> 57.6692, <6> 57.6692, <7> 57.6692;

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
