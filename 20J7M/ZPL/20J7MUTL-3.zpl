set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.8187, <2> 7.2703, <3> 29.7522, <4> 8.9711, <5> 7.479, <6> 36.4243, <7> 32.8656, <8> 7.1121, <9> 12.8368, <10> 23.6195, <11> 34.4938, <12> 35.0454, <13> 25.8613, <14> 27.3427, <15> 47.6757, <16> 12.2148, <17> 18.0209, <18> 37.3906, <19> 6.7709, <20> 11.6407;
param workload[JOB] := <1> 23.8187, <2> 7.2703, <3> 29.7522, <4> 8.9711, <5> 7.479, <6> 36.4243, <7> 32.8656, <8> 7.1121, <9> 12.8368, <10> 23.6195, <11> 34.4938, <12> 35.0454, <13> 25.8613, <14> 27.3427, <15> 47.6757, <16> 12.2148, <17> 18.0209, <18> 37.3906, <19> 6.7709, <20> 11.6407;
param capacity[MACHINE] := <1> 47.8507, <2> 47.8507, <3> 47.8507, <4> 47.8507, <5> 47.8507, <6> 47.8507, <7> 47.8507;

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
