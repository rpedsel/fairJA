set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 31.1351, <2> 25.6263, <3> 22.0198, <4> 31.0582, <5> 29.7349, <6> 25.8444, <7> 20.4149, <8> 34.7705, <9> 24.5793, <10> 23.7953, <11> 20.6736, <12> 37.6738, <13> 23.7389, <14> 28.9101, <15> 23.5248, <16> 24.147, <17> 31.435, <18> 25.513, <19> 22.9132, <20> 29.6594;
param workload[JOB] := <1> 969.3945, <2> 656.7073, <3> 484.8716, <4> 964.6118, <5> 884.1643, <6> 667.933, <7> 416.7681, <8> 1208.9877, <9> 604.142, <10> 566.2163, <11> 427.3977, <12> 1419.3152, <13> 563.5354, <14> 835.7939, <15> 553.4162, <16> 583.0776, <17> 988.1592, <18> 650.9132, <19> 525.0147, <20> 879.68;
param capacity[MACHINE] := <1> 2475.0166, <2> 2475.0166, <3> 2475.0166, <4> 2475.0166, <5> 2475.0166, <6> 2475.0166;

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
