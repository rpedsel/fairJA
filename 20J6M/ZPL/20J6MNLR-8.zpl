set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.6499, <2> 29.8103, <3> 21.4825, <4> 26.2513, <5> 23.7499, <6> 22.0988, <7> 21.9338, <8> 23.0703, <9> 19.4018, <10> 21.4496, <11> 36.3642, <12> 26.4113, <13> 17.881, <14> 23.2139, <15> 18.4917, <16> 18.3833, <17> 17.8845, <18> 19.0493, <19> 23.6808, <20> 27.5111;
param workload[JOB] := <1> 31.3074, <2> 17.2701, <3> 11.2388, <4> 44.1574, <5> 6.9128, <6> 8.187, <7> 0.7825, <8> 26.8944, <9> 17.0563, <10> 32.1034, <11> 2.964, <12> 4.9133, <13> 28.3826, <14> 47.2129, <15> 26.3459, <16> 9.5623, <17> 47.6201, <18> 10.0899, <19> 1.2198, <20> 25.2286;
param capacity[MACHINE] := <1> 66.5749, <2> 66.5749, <3> 66.5749, <4> 66.5749, <5> 66.5749, <6> 66.5749;

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
