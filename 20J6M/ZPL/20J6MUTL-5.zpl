set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 31.3104, <2> 3.8418, <3> 18.8322, <4> 39.6363, <5> 24.8462, <6> 18.4604, <7> 37.6891, <8> 31.8229, <9> 9.4932, <10> 36.8777, <11> 34.0667, <12> 6.5782, <13> 18.9339, <14> 12.6022, <15> 0.733, <16> 28.2373, <17> 31.2907, <18> 37.124, <19> 46.4979, <20> 38.7985;
param workload[JOB] := <1> 31.3104, <2> 3.8418, <3> 18.8322, <4> 39.6363, <5> 24.8462, <6> 18.4604, <7> 37.6891, <8> 31.8229, <9> 9.4932, <10> 36.8777, <11> 34.0667, <12> 6.5782, <13> 18.9339, <14> 12.6022, <15> 0.733, <16> 28.2373, <17> 31.2907, <18> 37.124, <19> 46.4979, <20> 38.7985;
param capacity[MACHINE] := <1> 63.4591, <2> 63.4591, <3> 63.4591, <4> 63.4591, <5> 63.4591, <6> 63.4591;

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
