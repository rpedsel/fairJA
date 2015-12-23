set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.4509, <2> 26.3754, <3> 21.1182, <4> 28.9791, <5> 20.0617, <6> 25.9598, <7> 26.9806, <8> 28.7175, <9> 25.547, <10> 27.1191, <11> 20.2041, <12> 31.4345, <13> 15.4222, <14> 24.3686, <15> 20.4729, <16> 26.1415, <17> 21.8199, <18> 33.9194, <19> 26.2675, <20> 29.9262;
param workload[JOB] := <1> 5.3339, <2> 5.1357, <3> 4.5955, <4> 5.3832, <5> 4.479, <6> 5.0951, <7> 5.1943, <8> 5.3589, <9> 5.0544, <10> 5.2076, <11> 4.4949, <12> 5.6066, <13> 3.9271, <14> 4.9365, <15> 4.5247, <16> 5.1129, <17> 4.6712, <18> 5.824, <19> 5.1252, <20> 5.4705;
param capacity[MACHINE] := <1> 100.5312, <2> 100.5312, <3> 100.5312, <4> 100.5312, <5> 100.5312, <6> 100.5312, <7> 100.5312;

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
