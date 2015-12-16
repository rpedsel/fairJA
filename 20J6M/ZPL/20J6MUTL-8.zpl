set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 15.6965, <2> 1.6781, <3> 32.6045, <4> 16.0765, <5> 34.2214, <6> 8.0415, <7> 9.4219, <8> 11.2264, <9> 2.9649, <10> 32.6557, <11> 34.8354, <12> 35.77, <13> 42.5151, <14> 48.6209, <15> 19.5482, <16> 26.0022, <17> 0.723, <18> 24.7852, <19> 48.2762, <20> 32.0325;
param workload[JOB] := <1> 15.6965, <2> 1.6781, <3> 32.6045, <4> 16.0765, <5> 34.2214, <6> 8.0415, <7> 9.4219, <8> 11.2264, <9> 2.9649, <10> 32.6557, <11> 34.8354, <12> 35.77, <13> 42.5151, <14> 48.6209, <15> 19.5482, <16> 26.0022, <17> 0.723, <18> 24.7852, <19> 48.2762, <20> 32.0325;
param capacity[MACHINE] := <1> 59.712, <2> 59.712, <3> 59.712, <4> 59.712, <5> 59.712, <6> 59.712;

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
