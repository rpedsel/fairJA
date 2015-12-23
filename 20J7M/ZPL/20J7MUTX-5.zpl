set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 34.4102, <2> 18.4781, <3> 18.3676, <4> 21.9546, <5> 5.9778, <6> 47.1721, <7> 20.2847, <8> 21.4263, <9> 18.6325, <10> 7.3069, <11> 8.4644, <12> 16.4715, <13> 4.3668, <14> 2.1772, <15> 5.2682, <16> 28.453, <17> 5.0627, <18> 18.4223, <19> 20.3633, <20> 14.1642;
param workload[JOB] := <1> 5.866, <2> 4.2986, <3> 4.2857, <4> 4.6856, <5> 2.445, <6> 6.8682, <7> 4.5039, <8> 4.6289, <9> 4.3165, <10> 2.7031, <11> 2.9094, <12> 4.0585, <13> 2.0897, <14> 1.4755, <15> 2.2953, <16> 5.3341, <17> 2.25, <18> 4.2921, <19> 4.5126, <20> 3.7635;
param capacity[MACHINE] := <1> 8.3124, <2> 8.3124, <3> 8.3124, <4> 8.3124, <5> 8.3124, <6> 8.3124, <7> 8.3124;

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
