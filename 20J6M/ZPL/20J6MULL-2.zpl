set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 46.5045, <2> 21.7254, <3> 6.0853, <4> 47.377, <5> 3.4543, <6> 14.108, <7> 23.6037, <8> 41.4443, <9> 30.6295, <10> 4.2885, <11> 21.3794, <12> 24.0454, <13> 41.027, <14> 24.8816, <15> 29.0703, <16> 22.203, <17> 24.2937, <18> 30.2295, <19> 19.2585, <20> 42.3063;
param workload[JOB] := <1> 46.5045, <2> 21.7254, <3> 6.0853, <4> 47.377, <5> 3.4543, <6> 14.108, <7> 23.6037, <8> 41.4443, <9> 30.6295, <10> 4.2885, <11> 21.3794, <12> 24.0454, <13> 41.027, <14> 24.8816, <15> 29.0703, <16> 22.203, <17> 24.2937, <18> 30.2295, <19> 19.2585, <20> 42.3063;
param capacity[MACHINE] := <1> 86.3192, <2> 86.3192, <3> 86.3192, <4> 86.3192, <5> 86.3192, <6> 86.3192;

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
