set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 42.7743, <2> 42.2786, <3> 17.8358, <4> 10.0866, <5> 0.6953, <6> 11.3237, <7> 8.4863, <8> 9.1938, <9> 46.3545, <10> 1.7378, <11> 37.5962, <12> 43.8202, <13> 24.7429, <14> 32.9978, <15> 5.6263, <16> 36.963, <17> 32.273, <18> 34.4671, <19> 43.76, <20> 18.5425;
param workload[JOB] := <1> 42.7743, <2> 42.2786, <3> 17.8358, <4> 10.0866, <5> 0.6953, <6> 11.3237, <7> 8.4863, <8> 9.1938, <9> 46.3545, <10> 1.7378, <11> 37.5962, <12> 43.8202, <13> 24.7429, <14> 32.9978, <15> 5.6263, <16> 36.963, <17> 32.273, <18> 34.4671, <19> 43.76, <20> 18.5425;
param capacity[MACHINE] := <1> 71.6508, <2> 71.6508, <3> 71.6508, <4> 71.6508, <5> 71.6508, <6> 71.6508, <7> 71.6508;

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
