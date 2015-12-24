set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 10.2841, <2> 10.2813, <3> 37.845, <4> 28.4063, <5> 8.9243, <6> 6.3598, <7> 0.4273, <8> 31.8424, <9> 6.1985, <10> 33.4097, <11> 27.7681, <12> 33.1204, <13> 49.1086, <14> 6.0084, <15> 1.4016, <16> 10.9072, <17> 6.7022, <18> 27.7063, <19> 40.5321, <20> 33.4873;
param workload[JOB] := <1> 12.158, <2> 18.9437, <3> 32.9441, <4> 9.0561, <5> 19.8743, <6> 36.8818, <7> 10.2111, <8> 36.624, <9> 7.0166, <10> 21.4048, <11> 48.0086, <12> 45.5518, <13> 14.7238, <14> 4.884, <15> 12.4263, <16> 6.9821, <17> 35.2437, <18> 27.9011, <19> 35.3757, <20> 16.0189;
param capacity[MACHINE] := <1> 48.4533, <2> 48.4533, <3> 48.4533, <4> 48.4533, <5> 48.4533, <6> 48.4533, <7> 48.4533;

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
