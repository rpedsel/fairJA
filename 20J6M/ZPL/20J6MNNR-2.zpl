set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.5614, <2> 24.2699, <3> 17.3274, <4> 27.0454, <5> 35.5025, <6> 34.1295, <7> 33.4763, <8> 26.4699, <9> 30.6374, <10> 24.656, <11> 21.9082, <12> 28.9208, <13> 25.2872, <14> 18.7819, <15> 26.7064, <16> 22.7318, <17> 22.7726, <18> 18.3419, <19> 32.0687, <20> 24.8324;
param workload[JOB] := <1> 24.2557, <2> 6.2572, <3> 14.4771, <4> 15.1616, <5> 18.703, <6> 45.6923, <7> 19.3314, <8> 42.3012, <9> 8.2445, <10> 9.3572, <11> 15.5168, <12> 2.1718, <13> 30.4385, <14> 29.2458, <15> 1.7959, <16> 25.5748, <17> 9.7899, <18> 18.9197, <19> 33.819, <20> 15.8122;
param capacity[MACHINE] := <1> 386.8656, <2> 386.8656, <3> 386.8656, <4> 386.8656, <5> 386.8656, <6> 386.8656;

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
