set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.1914, <2> 31.9198, <3> 28.4247, <4> 30.1037, <5> 33.0265, <6> 17.8591, <7> 34.2097, <8> 42.3467, <9> 37.0555, <10> 49.922, <11> 0.5586, <12> 11.1655, <13> 24.7861, <14> 49.0592, <15> 19.6351, <16> 20.3715, <17> 48.8206, <18> 43.9499, <19> 6.1781, <20> 9.0663;
param workload[JOB] := <1> 21.1914, <2> 31.9198, <3> 28.4247, <4> 30.1037, <5> 33.0265, <6> 17.8591, <7> 34.2097, <8> 42.3467, <9> 37.0555, <10> 49.922, <11> 0.5586, <12> 11.1655, <13> 24.7861, <14> 49.0592, <15> 19.6351, <16> 20.3715, <17> 48.8206, <18> 43.9499, <19> 6.1781, <20> 9.0663;
param capacity[MACHINE] := <1> 559.65, <2> 559.65, <3> 559.65, <4> 559.65, <5> 559.65, <6> 559.65, <7> 559.65;

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
