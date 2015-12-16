set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 7.4936, <2> 13.8584, <3> 34.6426, <4> 48.6296, <5> 30.6927, <6> 38.43, <7> 10.7645, <8> 0.0946, <9> 22.726, <10> 35.3351, <11> 11.6653, <12> 19.6946, <13> 47.9937, <14> 18.5985, <15> 32.4341, <16> 49.2253, <17> 22.2789, <18> 40.5008, <19> 39.2763, <20> 2.6281;
param workload[JOB] := <1> 46.0628, <2> 5.6756, <3> 32.4362, <4> 18.7397, <5> 35.3725, <6> 10.9228, <7> 24.6991, <8> 19.9257, <9> 18.8813, <10> 40.0046, <11> 44.65, <12> 30.3707, <13> 15.9802, <14> 19.719, <15> 39.0898, <16> 19.0081, <17> 15.575, <18> 49.9461, <19> 1.7171, <20> 48.8062;
param capacity[MACHINE] := <1> 537.5825, <2> 537.5825, <3> 537.5825, <4> 537.5825, <5> 537.5825, <6> 537.5825;

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
