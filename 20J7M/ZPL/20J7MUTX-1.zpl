set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 44.0843, <2> 7.6464, <3> 12.5035, <4> 30.3443, <5> 1.4739, <6> 36.9805, <7> 29.1386, <8> 34.3349, <9> 23.611, <10> 25.3194, <11> 16.962, <12> 12.867, <13> 16.0155, <14> 33.1067, <15> 29.5898, <16> 21.9677, <17> 39.8021, <18> 30.4034, <19> 27.1898, <20> 8.5474;
param workload[JOB] := <1> 6.6396, <2> 2.7652, <3> 3.536, <4> 5.5086, <5> 1.214, <6> 6.0812, <7> 5.398, <8> 5.8596, <9> 4.8591, <10> 5.0318, <11> 4.1185, <12> 3.5871, <13> 4.0019, <14> 5.7538, <15> 5.4397, <16> 4.687, <17> 6.3089, <18> 5.5139, <19> 5.2144, <20> 2.9236;
param capacity[MACHINE] := <1> 10.1188, <2> 10.1188, <3> 10.1188, <4> 10.1188, <5> 10.1188, <6> 10.1188, <7> 10.1188;

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
